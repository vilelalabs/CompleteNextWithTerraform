variable "sg-public" {}
variable "subnet-public" {}
variable "igw" {}

variable "ec2-ami-id" {
  default = "ami-07ffe1e45b5441531" # AMI Linux 2023 Free Tier
  description = "The AMI ID to use for the EC2 instance"
}

variable "ec2-instance-type" {
  default = "t2.nano" # nano -> 1 CPU 500Mb RAM
  description = "The type of instance to start"
}

variable "key-name" {
  type        = string
  description = "The name of the key pair that will be used to access the EC2 instance"
}

variable "my-ip-address" {
  type        = string
  description = "The IP address of the machine from which you will access the EC2 instance"
}
