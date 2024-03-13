provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "db" {
  ami           = "ami-0171207a7acd2a570"
  instance_type = "t2.micro"
}


resource "aws_instance" "web" {
  ami           = "ami-0171207a7acd2a570"
  instance_type = "t2.micro"

  depends_on = [aws_instance.db]
}
