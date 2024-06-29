provider "aws" {
  region = "var.aws_region"
}

resource "aws_instance" "ubuntu-apache" {
  ami           = "var.ami_id"
  instance_type = "t2.micro"
}