resource "aws_instance" "myinstance" {


  for_each = tomap({

    NanoInstance  = "t2.nano"
    MicroInstance = "t2.micro"
  })

  ami           = "ami-0cfde0ea8edd312d4"
  instance_type = each.value

  tags = {
    Name = each.key
  }
}