<!-- BEGIN_TF_DOCS -->

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
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region to deploy VPC | `string` | `"us-east-1"` | no |
## Modules

No modules.
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eks_ca_iam_role_arn"></a> [eks\_ca\_iam\_role\_arn](#output\_eks\_ca\_iam\_role\_arn) | AWS IAM role ARN for EKS Cluster Autoscaler |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.13.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 3.3.0 |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.9 |
## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.eks_ca_oidc_provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_policy.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.cluster_autoscaler](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks_ca_iam_policy_attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_eks_cluster.eks_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) | data source |
| [aws_iam_policy_document.cluster_autoscaler_sts_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [terraform_remote_state.eks](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.vpc](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [tls_certificate.tls](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

<!-- END_TF_DOCS -->