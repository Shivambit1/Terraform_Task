provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA35VQIYSWM5"
  secret_key = "G5iBrsSaqX5uQQ4DR"
}
#Instance creation 
resource "aws_instance" "myec2" {
    ami = "ami-05e411cf591b5c9f6"
    instance_type = "t2.micro"
}
# Security group 
