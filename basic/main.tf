# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"

#   tags = {
#     Name = var.inputname
#   }
# }

resource "aws_instance" "ec2-terraform" {
  ami           = "ami-0171207a7acd2a570"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2name
  }
}
