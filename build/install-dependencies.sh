#!/bin/bash -e

export GO111MODULE=off

# Go tools

if ! which ossc > /dev/null; then
	# do a get in a tmp dir to avoid local go.mod update
	cd $(mktemp -d) && GOSUMDB=off go get -u github.com/open-cluster-management/go-ossc/ossc
fi

# Build tools

if ! which operator-sdk > /dev/null; then
    OPERATOR_SDK_VER=v0.9.0
    curr_dir="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
    echo ">>> Installing Operator SDK"
    echo ">>> >>> Downloading source code"
    set +e
    # cannot use 'set -e' because this command always fails after project has been cloned down for some reason
    go get -d github.com/operator-framework/operator-sdk
    set -e
    cd $curr_dir/../operator-sdk
    echo ">>> >>> Checking out $OPERATOR_SDK_VER"
    git checkout .
    git checkout $OPERATOR_SDK_VER
    echo ">>> >>> Running make tidy"
    go version
    GO111MODULE=on make tidy
    echo ">>> >>> Running make install"
    GO111MODULE=on make install
    echo ">>> Done installing Operator SDK"
    operator-sdk version
    cd $curr_dir
fi
