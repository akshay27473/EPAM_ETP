terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile=var.profile
  access_key = var.access
  secret_key = var.secret
  
}

resource "aws_instance" "EPAM" {
    ami = "ami-007855ac798b5175e"
    instance_type="t2.micro"
    key_name="epam"
    vpc_security_group_ids = ["sg-0cd97cb5de9820cd5","sg-0d5088b51cab69113"]
        tags = {
            Name = var.name
            group = var.group
        }
}



