resource "aws_instance" "myinstance" {

  count = 3 #This argument is used to craete multiple instances. 
  #But count & for_each cannot be used together. 
  #One problem with this is thatit creates the multiple instances with the same name. 

  ami           = "ami-0cfde0ea8edd312d4"
  instance_type = "t2.micro"

  tags = {
    Name = "myinstance"
  }
}