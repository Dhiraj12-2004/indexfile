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
  key_name      = "linuxkp"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd

              cat <<HTML > /var/www/html/index.html
              <!DOCTYPE html>
              <html>
                <head>
                  <title>Terraform EC2 Website</title>
                </head>
                <body>
                  <h1>Hello from Terraform 🚀</h1>
                  <p>This website is deployed using Terraform on AWS EC2.</p>
                </body>
              </html>
              HTML
              EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}
