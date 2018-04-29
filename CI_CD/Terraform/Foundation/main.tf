provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "533159-bucket"
    key    = "ccs-demo/foundation/terraform.tfstate"
    region = "us-east-1"
  }
}
