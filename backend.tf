terraform {
  backend "s3" {
    bucket = "terraform-state-complete-next-js-study"
    region = "us-east-1"
    key    = "terraform.tfstate"
  }

}