# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = var.inputname
#   }
# }

resource "aws_instance" "ec2-terraform" {
  ami             = "ami-0171207a7acd2a570"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtrafic.name]
  tags = {
    Name = "ec2-terrafrom"
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.ec2-terraform.id
}

resource "aws_security_group" "webtrafic" {
  name = "allow HTTPS"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
