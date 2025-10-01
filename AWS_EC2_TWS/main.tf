# Key pair (Login)

resource "aws_key_pair" "mykey" {

    key_name = "terra-key"
    public_key = file("terra-key.pub")
  
}

resource "aws_default_vpc" "myvpc" {
  
}

resource "aws_security_group" "mysg" {

    vpc_id = aws_default_vpc.myvpc.id

    #inbound rule

    ingress {

        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  #it comes in list because we can add multiple in it.
        description = "SSH Open"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "HTTP Open"
    }

    #outbound rule

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "all access open outbound"
    }
}

resource "aws_instance" "myinst" {

    key_name = aws_key_pair.mykey.key_name
    security_groups = [aws_security_group.mysg.name]
    ami = "ami-0cfde0ea8edd312d4"
    instance_type = "t2.micro"

    root_block_device {
      volume_size = 15
      volume_type = "gp3"
    }

    tags = {
      Name="TWS_INST"
    }
  
}