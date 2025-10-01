resource "aws_instance" "myinst" {

  ami           = "ami-0cfde0ea8edd312d4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pubsub.id

  vpc_security_group_ids      = [aws_security_group.mysg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y nginx
              systemctl start nginx
              systemctl enable nginx
            EOF

  tags = {
    Name = "Nginx_Server"
  }

}