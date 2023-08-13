provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAIYSWM5"
  secret_key = "G5iBrs4XLiWwu7rKFD1SaqX5uQQ4DR"
}
variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}