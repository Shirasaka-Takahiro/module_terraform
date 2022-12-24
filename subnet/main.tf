resource "aws_subnet" "public-1a" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.cidr, 8, 10)

  tags = { 
    Name = "${var.project}-${var.env}-public-1a"
  }
}

resource "aws_subnet" "public-1c" {
  vpc_id = var.vpc_id
  cidr_block = cidrsubnet(var.cidr, 8, 30)

  tags = {
    Name = "${var.project}-${var.env}-public-1c"
  }
}