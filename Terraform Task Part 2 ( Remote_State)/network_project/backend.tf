terraform {
  backend "s3" {
    bucket = "splabs-terraform-backend"
    key    = "network/eip.tfstate"
    region = "us-east-1"
  }
}
