resource "aws_instance" "example" {
  ami               = "ami-02b8269d5e85954ef"
  instance_type     = "t3.micro"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1a"
  size              = 1
  tags = {
    Name = "HelloWorld"
  }
  type = "gp3"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.example.id
}