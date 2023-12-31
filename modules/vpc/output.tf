output "vpc" {
  value = aws_vpc.vpc
}

output "subnet-public" {
  value = aws_subnet.subnet-public
}

output "igw" {
  value = aws_internet_gateway.igw
}

output "sg-public" {
  value = aws_security_group.sg-public
}
