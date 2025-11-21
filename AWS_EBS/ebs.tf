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
