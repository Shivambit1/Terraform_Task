provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA35VPLGXVZQIYSWM5"
  secret_key = "G5iBrs4X1SaqX5uQQ4DR"
}
#Instance creation 
/*resource "aws_instance" "myec2" {
  ami           = "ami-05e411cf591b5c9f6"
  instance_type = "t2.micro"
}*/
/*resource "aws_iam_user" "iam" {
  for_each = toset( ["user-01","user-02", "user-03"] )
  name     = each.key
}
*/
resource "aws_instance" "myec2" {
  ami = "ami-05e411cf591b5c9f6"
  for_each  = {
      key1 = "t2.micro"
      key2 = "t2.medium"
   }
  instance_type    = each.value
  key_name         = each.key
  tags =  {
   Name = each.value
    }
}