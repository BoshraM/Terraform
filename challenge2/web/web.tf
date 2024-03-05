resource "aws_instance" "web" {
  ami             = "ami-0171207a7acd2a570"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.webtrafic.name]
  # user_data       = file("server-script.sh")
  tags = {
    Name = "Web server"
  }
}


module "eip" {
  source = "../eip"
}

output "instance_id" {
  value = aws_instance.web.id
}
