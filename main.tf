resource "aws_instance" "webserver" {
  ami                     = var.ami
  instance_type           = local.instance_type
  key_name                = var.key_name
  security_groups         = var.security_groups

  tags = {
    name = var.name
    environment = var.environment
  }
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip
    private_key = var.EC2-Token
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}