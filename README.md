### Ecommerce microservice
### Architecture
![App Screenshot](https://raw.githubusercontent.com/itp9177/Micro-services/main/architecture.png)
### Quick start 
##### step 1 (requirements)

```javascript
you need kubectl, minikube, terraform and helm installed 
```
##### step 2
configure minikube cluster with at least 12000MB memory 

```javascript
minikube start --memory=12000mb
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
Apisix dashboard url

```javascript
export POD_NAME=$(kubectl get pods --namespace ingress-apisix -l "app.kubernetes.io/name=apisix-dashboard,app.kubernetes.io/instance=apisix-dashboard" -o jsonpath="{.items[0].metadata.name}")

 export CONTAINER_PORT=$(kubectl get pod --namespace ingress-apisix $POD_NAME -o jsonpath="{.spec.containers[0].ports[0].containerPort}")

 kubectl --namespace ingress-apisix port-forward $POD_NAME 8080:$CONTAINER_PORT
```
```javascript

username : admin , password : admin
```
##### step 7
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