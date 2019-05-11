provider "aws" {

 access_key = "Enter_access_key"
 secret_key = "Enter_secret_key"
 region = "us-east-1"

}

resource "aws_instance" "my-instance" {
  ami = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
tags {

    Name = "terraform1"
  }

  key_name = "keypair"
  subnet_id = "subnet-953f8dbb"
  associate_public_ip_address = "true"
  vpc_security_group_ids = ["sg-08222a038c4ccc92a"]
    user_data = <<EOF
#!/bin/bash
yum update -y
yum install httpd -y
systemctl enable httpd
systemctl start httpd

EOF

}

