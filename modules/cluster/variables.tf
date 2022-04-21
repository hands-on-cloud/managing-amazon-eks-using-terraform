variable "private_subnet_ids" {
  type = list(string)
  description = "List of private subnet ids in the VPC - comes from main.tf"
}

variable "public_subnet_ids" {
  type = list(string)
  description = "List of public subnet ids in the VPC - comes from main.tf"
}