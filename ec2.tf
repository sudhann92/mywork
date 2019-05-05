provider "aws" {

 access_key = "Enter_access_key"
 secret_key = "Enter_secret_key"
 region = "us-east-1"

}

resource "aws_instance" "my_test"{
  ami = "ami-0015b9ef68c77328d"
  instance_type = "t2.micro"
tags {

    Name = "test-instance"

  }

  key_name = "keypair"

  subnet_id = "subnet-953f8dbb"
  associate_public_ip_address = "true"

}

