resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description = "SSH into VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "myec2" {
   ami = "ami-05e411cf591b5c9f6"
   instance_type = "t2.micro"
   key_name = "mykey"
   vpc_security_group_ids  = [aws_security_group.allow_ssh.id]

   provisioner "remote-exec" {
     on_failure = continue
     inline = [
       "sudo yum -y install nano"
     ]
   }
   connection {
     type = "ssh"
     user = "ec2-user"
     private_key = file("./terraform-key.pem")
     host = self.public_ip
   }
}