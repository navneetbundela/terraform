
# creating vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "myvpc"
  }
}

# creating private subnet 
resource "aws_subnet" "myprivatesubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "private-subnet"
  }
}

# creating public subnet
resource "aws_subnet" "mypublicsybnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "public-subnet"
  }
}

# creating Internet Gateway
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my_igw"
  }

}

# Creating Route Table

resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

}

resource "aws_route_table_association" "public_sub" {
  route_table_id = aws_route_table.myroutetable.id
  subnet_id      = aws_subnet.mypublicsybnet.id
}

resource "aws_instance" "myinstance" {
  ami           = "ami-0cfde0ea8edd312d4"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.mypublicsybnet.id

  tags = {
    Name = "my_Instance"
  }
}