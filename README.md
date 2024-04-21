### Ecommerce microservice
### Architecture
### Quick start 
##### step 1 (requirements)

```javascript
you need kubectl, minikube, terraform and helm installed 
```
##### step 2
configure minikube cluster with at least 7000MB memory 

```javascript
minikube start --memory=7000mb
```

##### step 3
configure terraform kubernetes provider 
```javascript
cd /teraform 

configure provider.tf 

provider "kubernetes" {
  config_path    = "<your configi path>" (eg : /home/indu/.kube/config" )
  config_context = "minikube"
}
```

##### step 4 
terraform init, plan and apply

```javascript
cd /teraform

terraform init
terraform plan
terraform apply

```

this may take couple of minutes to install

##### step 5
once installation is complete, access the kiali dashboard

```javascript
kubectl port-forward svc/kiali 20001:20001 -n istio-system
```
kiali dashboard 
```javascript
localhost:20001
```
##### step 6
jenkins admin password

```javascript
jsonpath="{.data.jenkins-admin-password}"
secret=$(kubectl get secret -n jenkins jenkins -o jsonpath=$jsonpath)
echo $(echo $secret | base64 --decode)
```

jenkins urls
```javascript

jsonpath="{.spec.ports[0].nodePort}"
NODE_PORT=$(kubectl get -n jenkins -o jsonpath=$jsonpath services jenkins)
jsonpath="{.items[0].status.addresses[0].address}"
NODE_IP=$(kubectl get nodes -n jenkins -o jsonpath=$jsonpath)
echo http://$NODE_IP:$NODE_PORT/login
```


### RoadMap
- [x]  Microservices architecture
- [x]  Cloud components
- [ ]  support for AWS EKS cluster installation
- [ ]  support for GCP GKE cluster installation