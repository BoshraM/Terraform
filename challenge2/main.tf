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

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "PrivateIP" {
  value = module.db.PrivateIP
}

output "publicIP" {
  value = module.web.publicIP
}
