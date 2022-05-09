# Amazon EKS Cluster Autoscaler configuration

This is a demo repository for the [How to Set Up Amazon EKS Cluster Using Terraform](https://hands-on.cloud/how-to-set-up-amazon-eks-cluster-using-terraform/) article.

This module sets up the following AWS services:

* Amazon IAM OpenID provider
* Amazon IAM Cluster Autoscaler role

![Amazon EKS Cluster Autoscaler](https://hands-on.cloud/wp-content/uploads/2022/04/How-to-Set-Up-Amazon-EKS-Cluster-Using-Terraform-Deployment-architecture-overview.png)

## Deployment

```sh
terraform init
terraform plan
terraform apply -auto-approve
```

## Tier down

```sh
terraform destroy -auto-approve
```
