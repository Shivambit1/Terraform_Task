
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA35VPLGXVZQIYSWM5"
  secret_key = "G5iBrs4D1SaqX5uQQ4DR"
}

variable "elb_names" {
  type = list
  default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
}

resource "aws_iam_user" "lb" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}