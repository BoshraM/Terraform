
resource "aws_instance" "db" {
  ami           = "ami-0171207a7acd2a570"
  instance_type = "t2.micro"
  tags = {
    Name = "DB server"
  }
}

output "PrivateIP" {
  value = aws_instance.db.private_ip
}
