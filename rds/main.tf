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

# resource "aws_db_instance" "default" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   port                 = 3306
#   skip_final_snapshot  = true
# }

/// craeting PostgreSQL RDS ////

resource "aws_db_instance" "mypsql" {
  engine              = "Postgres"
  identifier          = "mypsql"
  allocated_storage   = 20
  engine_version      = "16.1"
  db_name             = "mypsql"
  instance_class      = "db.t3.micro"
  username            = "postgres"
  password            = "admin1234"
  skip_final_snapshot = true
  publicly_accessible = true
}


output "db_instance_endpoint" {
  value = aws_db_instance.mypsql.endpoint

}
