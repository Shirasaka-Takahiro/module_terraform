variable "general_config" {
  type = map(any)
}
variable "vpc_cidr" {}
variable "availability_zones" {}
variable "public_subnets" {}
variable "private_subnets" {}
variable "ami" {}
variable "instance_role" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}
variable "public_subnet_ids" {}
variable "instance_ids" {}
variable "zone_name" {}
variable "sub_domain" {}