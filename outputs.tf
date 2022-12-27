output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "eip_ec2_01" {
  value = aws_eip.eip_ec2_01.public_ip
}

output "eip_ec2_02" {
  value = aws_eip.eip_ec2_02.public_ip
}