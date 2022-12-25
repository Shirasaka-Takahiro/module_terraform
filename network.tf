##VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-vpc"
  }
}

##Public Subnet 1a
resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_1a
  availability_zone       = var.availability_zone_1a
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-public-1a"
  }
}

##Public Subnet 1c
resource "aws_subnet" "public_subnet_1c" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_1c
  availability_zone       = var.availability_zone_1c
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-public-1c"
  }
}

##Private Subnet 1a
resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_1a
  availability_zone = var.availability_zone_1a

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-private-1a"
  }
}

##Private Subnet 1c
resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_1c
  availability_zone = var.availability_zone_1c

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-private-1c"
  }
}

##Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-igw"
  }
}

##Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-pubic-rtb"
  }
}

##Public Internet Gateway
resource "aws_route" "public_internet_gateway" {
  gateway_id             = aws_internet_gateway.internet_gateway.id
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
}

##Public Route Association 1a
resource "aws_route_table_association" "public_route_association_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.public_route_table.id
}

##Public Route Association 1c
resource "aws_route_table_association" "public_route_association_1c" {
  subnet_id      = aws_subnet.public_subnet_1c.id
  route_table_id = aws_route_table.public_route_table.id
}

##Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-private-rtb"
  }
}

##Private Route Assocition 1a
resource "aws_route_table_association" "private_route_association_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_route_table.id
}

##Private Route Association 1c
resource "aws_route_table_association" "private_route_association_1c" {
  subnet_id      = aws_subnet.private_subnet_1c.id
  route_table_id = aws_route_table.private_route_table.id
}