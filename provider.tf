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

   user_data = <<-EOF
              #!/bin/bash
              exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
              set -x
              sudo apt-get update
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo '<html><h1>Hello for test purpose, Terraform!</h1></html>' > /var/www/html/index.html
              EOF
}