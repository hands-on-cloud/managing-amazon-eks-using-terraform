variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  default     = "terraform-eks-cluster"
  description = "Name of the EKS cluster"
}