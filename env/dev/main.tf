provider "aws" {
  profile = "tera-user"
  region  = "ap-northeast-1"
}

module "dev" {
  source = "../../"

  general_config     = var.general_config
  availability_zones = var.availability_zones
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  ami                = var.ami
  key_name           = var.key_name
  instance_role      = var.instance_role
  instance_type      = var.instance_type
  volume_type        = var.volume_type
  volume_size        = var.volume_size
}