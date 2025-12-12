terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-00ca570c1b6d79f36"
  instance_type = "t3.micro"
 key_name   = "linuxkp"

  tags = {
    Name = "HelloWorld"
  }
}