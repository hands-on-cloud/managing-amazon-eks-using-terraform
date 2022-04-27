variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet ids in the VPC - comes from main.tf"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "List of public subnet ids in the VPC - comes from main.tf"
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster - comes from main.tf"
}