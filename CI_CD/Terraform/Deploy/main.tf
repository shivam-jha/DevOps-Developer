provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {
    bucket = "533159-bucket"
    key    = "ccs-demo/dev/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "foundation" {
  backend = "s3"
  config {
    bucket = "533159-bucket"
    key    = "ccs-demo/foundation/terraform.tfstate"
    region = "${var.region}"
  }
}
