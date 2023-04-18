terraform {
  required_version = "~> 1.4"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}

# Provider Block.
provider "aws" {
  region  = "eu-central-1"
  profile = "default"
}


resource "aws_instance" "my-ec2-vm" {
  ami               = "ami-0fa03365cde71e0ab"
  instance_type     = "t2.micro"
  availability_zone = "eu-central-1b"
  tags = {
    "tag1" = "Update-test-1" 
    "Name" = "web1"   
  }
}
