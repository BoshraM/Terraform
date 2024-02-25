resource "aws_instance" "db" {
  ami           = "ami-0171207a7acd2a570"
  instance_type = "t2.micro"
  tags = {
    Name = "DB server"
  }
}

resource "aws_instance" "web" {
  ami             = "ami-0171207a7acd2a570"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtrafic.name]
  user_data       = file("server-script.sh")
  tags = {
    Name = "Web server"
  }
}

resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
}

resource "aws_security_group" "webtrafic" {
  name = "Allow Web Traffic"

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


output "PrivateIP" {
  value = aws_instance.db.private_ip
}

output "publicIP" {
  value = aws_eip.web_eip.public_ip
}
