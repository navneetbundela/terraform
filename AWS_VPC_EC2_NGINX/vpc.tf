resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "VPC"
  }

}

resource "aws_subnet" "prisub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "pri_sub"
  }

}

resource "aws_subnet" "pubsub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "pub_sub"
  }
}

resource "aws_internet_gateway" "igw" {

  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "intgatway"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}

resource "aws_route_table_association" "ra" {
  route_table_id = aws_route_table.rt.id
  subnet_id      = aws_subnet.pubsub.id

}
