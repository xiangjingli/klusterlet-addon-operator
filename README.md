# Intro 
Klusterlet component operator is a helm operator created using the operator-sdk


## Running Klusterlet Component Operator for development 

1. Install CRDs required by the operator 
```
make install-crd
```

2. Link the `klusterlet-component-operator/helm-charts` directory to `/opt/helm/helm-charts`
```
sudo mkdir /opt/helm
sudo ln -s $(pwd)/helm-charts /opt/helm/
```

3. Run Klusterlet Component Operator on your laptop
```
make run
```

## Using Klusterlet Component Operator to deploy the components 
To manually create a instance of the component you will need to create the component CR the spec of the CR will be use as the value override for the helm chart associated with the .the `deploy/crd` folder contain example CR for the components 

The https://github.ibm.com/IBMPrivateCloud/ibm-klusterlet-operator project automaically create and manage the update of the CR for the components in the Klusterlet component operator. See Klusterlet Operator's README for how to run the Klusterlet Operator