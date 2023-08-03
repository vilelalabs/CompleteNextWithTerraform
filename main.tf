provider "aws" {
  region     = var.region
  access_key = var.access-key
  secret_key = var.secret-key
}

module "vpc" {
  source        = "./modules/vpc"
  my-ip-address = var.my-ip-address
}

module "ec2" {
  source         = "./modules/ec2"
  key-name       = var.key-name
  my-ip-address  = var.my-ip-address
  sg-public      = module.vpc.sg-public
  subnet-public  = module.vpc.subnet-public
  igw            = module.vpc.igw
}
