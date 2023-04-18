# Resource-10 - Creating Elastic IP Address:

resource "aws_eip" "my_elastic_ip_01" {
  instance = aws_instance.my_instance_01.id
  vpc      = true
  # Meta argument:
  depends_on = [
    aws_internet_gateway.my_internet_gateway_01
  ]
}