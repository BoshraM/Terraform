terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "ec2module" {
  source  = "./ec2"
  ec2name = "Name For Mudule"
}

output "module_output" {
  value = module.ec2module.instance_id
}
