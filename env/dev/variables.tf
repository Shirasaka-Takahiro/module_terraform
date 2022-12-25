variable "general_config" {
  type = map(any)
  default = {
    project = "example"
    env     = "dev"
  }
}

variable "availability_zone_1a" {
  default = "ap-northeast-1a"
}

variable "availability_zone_1c" {
  default = "ap-northeast-1c"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_1a" {
  default = "10.0.10.0/24"
}

variable "public_subnet_1c" {
  default = "10.0.30.0/24"
}

variable "private_subnet_1a" {
  default = "10.0.20.0/24"
}

variable "private_subnet_1c" {
  default = "10.0.40.0/24"
}