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

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
