provider "aws" {
  profile = "tera-user"
  region  = "ap-northeast-1"
}

module "network" {
  source = "../.."

  general_config       = var.general_config
  availability_zone_1a = var.availability_zone_1a
  availability_zone_1c = var.availability_zone_1c
  vpc_cidr             = var.vpc_cidr
  public_subnet_1a     = var.public_subnet_1a
  public_subnet_1c     = var.public_subnet_1c
  private_subnet_1a    = var.private_subnet_1a
  private_subnet_1c    = var.private_subnet_1c
}

module "EC2" {
  source = "../.."

  general_config = var.general_config
  public_subnet_1a = var.public_subnet_1a
  public_subnet_1c = var.public_subnet_1c
  key_name = var.keyname
  instance_type = var.instance_type
  volume_type = var.volume_type
  volume_size = var.volume_size
}