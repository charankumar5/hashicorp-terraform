# Resource-1: Creating a VPC:

resource "aws_vpc" "my_vpc_01" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "VPC_Local"
  }

}

# Resource-2: Creating a Subnet:

resource "aws_subnet" "My_subnet_01" {
  vpc_id                  = aws_vpc.my_vpc_01.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true
}

# Resource-3: Creating Internet Gateway:

resource "aws_internet_gateway" "my_internet_gateway_01" {
  vpc_id = aws_vpc.my_vpc_01.id

}
# Resource-4: Creating Route Table:

resource "aws_route_table" "my_route_table_01" {
  vpc_id = aws_vpc.my_vpc_01.id
}
# Resource-5: Creating Route in Route Table for Internet Access:

resource "aws_route" "my_route_01" {
  route_table_id         = aws_route_table.my_route_table_01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_internet_gateway_01.id

}
# Resource-6: Associate the Route Table with the subnet:

resource "aws_route_table_association" "route_table_subnet_associate" {
  route_table_id = aws_route_table.my_route_table_01.id
  subnet_id      = aws_subnet.My_subnet_01.id

}
# Resource-7: Create Security Group:

resource "aws_security_group" "my_security_group_01" {
  name   = "my_security_group_01"
  vpc_id = aws_vpc.my_vpc_01.id

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = " Allow all Ip and ports in outbound."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


}
