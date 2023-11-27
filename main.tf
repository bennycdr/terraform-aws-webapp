resource "aws_instance" "webserver" {
  ami                     = var.ami
  instance_type           = local.instance_type
  key_name                = var.key_name
  security_groups         = var.security_groups

  tags = {
    Name = var.name
    Environment = var.environment
    owner = var.owner
  }
  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip
    private_key = var.ec2-token
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}