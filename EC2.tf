##EC2
resource "aws_instance" "ec2_01" {
  ami       = var.ami
  subnet_id = aws_subnet.public_subnet_1a.id
  vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.ec2.id
  ]
  key_name      = aws_key_pair.key.id
  instance_type = var.instance_type
  root_block_device {
    volume_type  = var.volume_type
    volume_size = var.volume_size
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-web01"
  }
}

##EC2
resource "aws_instance" "ec2_02" {
  ami       = var.ami
  subnet_id = aws_subnet.public_subnet_1c.id
  vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.ec2.id
  ]
  key_name      = aws_key_pair.key.id
  instance_type = var.instance_type
  root_block_device {
    volume_type  = var.volume_type
    volume_size = var.volume_size
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-web02"
  }
}

##Elastic IP
resource "aws_eip" "eip_ec2_01" {
  vpc      = true
  instance = aws_instance.ec2_01.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-eip-web01"
  }
}

resource "aws_eip" "eip_ec2_02" {
  vpc      = true
  instance = aws_instance.ec2_02.id

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["env"]}-eip-web02"
  }
}

##Key Pair
resource "aws_key_pair" "key" {
  key_name   = var.key_name
  public_key = file("~/.ssh/example.pub")
}