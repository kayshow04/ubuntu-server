provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ubuntu-apache" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name      = "ubuntukey"
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]

   tags = {
     Name = "ubuntu-apache"
   }
 }