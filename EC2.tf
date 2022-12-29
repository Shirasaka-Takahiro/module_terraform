##Number for identiying instance
locals {
  list = [
    1,
    2,
    3,
    4,
    5
  ]
}

##EC2
resource "aws_instance" "ec2" {
  ami       = var.ami
  for_each = var.public_subnets.subnets
  subnet_id = aws_subnet.public_subnets[each.key].id
  vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.ec2.id
  ]
  key_name      = aws_key_pair.key.id
  instance_type = var.instance_type
  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-web0"
  }
}

##Elastic IP
resource "aws_eip" "eip_ec2" {
  vpc      = true
  for_each = aws_instance.ec2
  instance = each.value.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-eip-web01"
  }
}

##Key Pair
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/example.pub")
}