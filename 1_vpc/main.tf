locals {
  prefix        = "managing-eks-terraform"
  vpc_name      = "${local.prefix}-vpc"
  vpc_cidr      = var.vpc_cidr
  common_tags   = {
    Environment = "dev"
    Project     = "hands-on.cloud"
  }
}
