terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "myinstance" {
    ami = "ami-0cfde0ea8edd312d4"
    instance_type = "t2.nano"

    tags = {
      Name= "SampleServer"
    }
  
}