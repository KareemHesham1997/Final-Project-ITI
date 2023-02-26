# final-project-ITI
GCP with Terraform and Jenkins![project-overview](https://user-images.githubusercontent.com/91802602/221412299-fc5e1397-0555-4af5-af11-779c29a02779.png)


Deploy a Python web application on GKE using CI/CD Jenkins Pipeline using the following steps and high-level diagram:


1. Implement a secure GKE Cluster
2. Deploy and configure Jenkins on GKE
3. Deploy the backend application on GKE using the Jenkins pipeline

Infastructure:
```
Service-account
VPC
2 private-subnets (management, restricted)
nat
cloud-router
firewall (Allow ssh and http)
vm (bastion host)
GKE
```

1) Apply the infrastructure using Terraform
```bash
 $ terraform init
 $ terraform plan
 $ terraform apply
 ```
2) Build dockerfile and push it to dockerhub
```
 docker build . -t karimhisham/jenkins:v1
 docker push karimhisham/jenkins:v1
```
 
3) ssh to the vm and install google cloud and kubectl and connect to the gke
```
 sudo apt update
 gcloud auth login
 sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
 sudo apt-get install kubectl
 gcloud container clusters get-credentials private-cluster --zone us-central1-a --project kareem-project-375811
 ```
4) Vim or Upload the YAML files in the cluster
 ```
 kubectl apply -f "yaml file name".yaml
 ```
5) Connect to the jenkins

```
take the ip of the loadbalancer it will open the jenkins page
kubectl get pods -n jenkins
kubectl exec "name of the pod" -it -n jenkins -- /bin/bash
install jenkins
```
6) Build the pipeline
```
put yor github and dockerhub credentials
build the pipeline with pipeline script and add this repo https://github.com/KareemHesham1997/Simple-App-CI-CD.
```
7) Connect to the App
```
take the ip of the second loadbalancer it will open the app page
```
# Jenkins link: http://34.28.135.96:8080/
# App link: http://35.193.50.30/

  
  
