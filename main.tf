module "networking" {
  source     = "./modules/networking"
  aws_region = var.region
}

module "cluster" {
  source             = "./modules/cluster"
  public_subnet_ids  = module.networking.public_subnet_ids
  private_subnet_ids = module.networking.private_subnet_ids
}