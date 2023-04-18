# Terraform settings block:
terraform {
  required_version = "~>1.4"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}

# Terraform Providers:

provider "aws" {
  region  = "eu-central-1"
  profile = "default" # defining it is optional for default profile
}

