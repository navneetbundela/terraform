terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
  }

  # By this Backend block we can specify where we wants to store our .tfstate file
  backend "s3" {
    bucket = "my-bucket-d3fe2317d466c103"
    key    = "tf.tfstate"
    region = "us-east-2"

  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "inst" {

  ami           = "ami-0cfde0ea8edd312d4"
  instance_type = "t2.nano"

  tags = {
    Name = "Server_For_S3"
  }

}