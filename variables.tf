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
variable "private_subnet_ids" {}
variable "instance_ids" {}
variable "zone_name" {}
variable "sub_domain" {}
variable "engine_name" {}
variable "major_engine_version" {}
variable "engine" {}
variable "engine_version" {}
variable "username" {}
variable "password" {}
variable "instance_class" {}
variable "storage_type" {}
variable "allocated_storage" {}
variable "multi_az" {}
variable "sns_email" {}
variable "cwa_actions" {}
variable "cwa_threshold_rds_freeablememory" {}
variable "cwa_threshold_rds_freeablestorage" {}