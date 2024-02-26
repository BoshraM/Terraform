variable "ec2name" {
  type    = string
  default = "myec2"
}

resource "aws_instance" "ec2-terraform" {
  ami           = "ami-0171207a7acd2a570"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}

output "instance_id" {
  value = aws_instance.ec2-terraform.id
}
