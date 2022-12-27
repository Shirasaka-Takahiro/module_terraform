##Security Group for internal traffic
resource "aws_security_group" "common" {
  vpc_id = aws_vpc.vpc.id

  ##internal
  ingress {
    cidr_blocks = ["${var.vpc}"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["environment"]}-common-sg"
  }
}

##Security Group for Web instance
resource "aws_security_group" "ec2" {
  vpc_id = aws_vpc.vpc.id

  ##ssh
  ingress {
    cidr_blocks = ["119.229.192.95/32"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ##all_out
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    Name = "${var.general_config["project"]}-${var.general_config["environment"]}-ec2-sg"
  }
}