variable "general_config" {
  type = map(any)
}
variable "availability_zone_1a" {}
variable "availability_zone_1c" {}
variable "vpc" {}
variable "vpc_cidr" {}
variable "public_subnet_1a" {}
variable "public_subnet_1c" {}
variable "private_subnet_1a" {}
variable "private_subnet_1c" {}
variable "ami" {}
variable "instance_type" {}
variable "volume_type" {}
variable "volume_size" {}
variable "key_name" {}