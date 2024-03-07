
resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
}


output "publicIP" {
  value = aws_eip.web_eip.public_ip
}
