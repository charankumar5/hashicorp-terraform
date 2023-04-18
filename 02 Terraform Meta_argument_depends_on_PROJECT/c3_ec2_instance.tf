# Resource-9 Creating a EC2 Instance:

resource "aws_instance" "my_instance_01" {

  ami                    = "ami-0fa03365cde71e0ab" # Amazon Linux:
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.My_subnet_01.id
  vpc_security_group_ids = [aws_security_group.my_security_group_01.id]
  key_name               = "my_key"
  availability_zone      = "eu-central-1a"
  user_data              = file("apache_script.sh")
}