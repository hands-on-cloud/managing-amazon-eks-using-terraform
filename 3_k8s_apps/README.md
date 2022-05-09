# Amazon EKS Cluster - Demo applications

This is a demo repository for the [How to Set Up Amazon EKS Cluster Using Terraform](https://hands-on.cloud/how-to-set-up-amazon-eks-cluster-using-terraform/) article.

This repository contains the following EKS demo applications:

* Default Nginx app
* EKS Cluster Autoscaler
* Horizontal Pod Autoscaler (HPA)

![Amazon EKS Cluster - Demo applications](https://hands-on.cloud/wp-content/uploads/2022/04/How-to-Set-Up-Amazon-EKS-Cluster-Using-Terraform-Deployment-architecture-overview.png)

## Deployment

```sh
kubectl apply -f ./nginx/nginx.yml
kubectl apply -f ./hpa/hpa.yml
```

## Tier down

```sh
kubectl delete -f ./hpa/hpa.yml
kubectl delete -f ./nginx/nginx.yml
```
