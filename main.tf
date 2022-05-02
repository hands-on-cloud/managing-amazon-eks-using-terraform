module "networking" {
  source       = "./modules/networking"
  aws_region   = var.region
  cluster_name = var.cluster_name
}

module "cluster" {
  source             = "./modules/cluster"
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
  cluster_name       = var.cluster_name
}

#log the eks-cluster-autoscaler-role IAM role ARN:
output "eks_ca_iam_role_arn" {
  value = module.cluster.eks_ca_iam_role_arn
}