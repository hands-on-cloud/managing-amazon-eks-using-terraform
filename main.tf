module "networking" {
  source = "./modules/networking"
  aws_region = var.region
}