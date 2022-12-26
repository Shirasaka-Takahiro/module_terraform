##EC2
resource "aws_instance" "EC2_01" {
  ami = var.ami
  subnet_id = var.public_subnet_1a
}