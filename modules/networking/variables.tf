variable "aws_region" {
  type        = string
  description = "The AWS region to create the VPC resources in - comes from main.tf"
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster - comes from main.tf"
}