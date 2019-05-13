resource "aws_instance" "example_instance" {
   ami = "ami-0b6158cfa2ae7b493"
   instance_type = "t2.micro"
tags {

    Name = "windows_server"
  }

  key_name = "${var.key_value}"
  subnet_id = "${var.subnet}"
  associate_public_ip_address = "${var.public_ip}"
  vpc_security_group_ids = ["${var.security_group}"]
  user_data = <<EOF
<powershell>
net user ${var.instance_username} ${var.instance_password} /add
net localgroup administrators ${var.instance_username} /add
</powershell>
EOF
}
