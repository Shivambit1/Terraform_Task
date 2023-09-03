provider "aws" {
  region     = "us-west-2"
  access_key = "KEY"
  secret_key = "KEY"
}

resource "aws_instance" "myec2" {
  ami           = "ami-05e411cf591b5c9f6"
  instance_type = "t2.medium"
  key_name      = "mykey"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
     "sudo yum install -y nginx",
     "sudo systemctl start nginx"
   
  }
}

