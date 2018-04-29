variable "name" {}
variable "region" {}
variable "vpc_cidr" {}
variable "enable_dns_hostnames" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = "false"
}
variable "key_name" {}

variable "enable_dns_support" {
  description = "should be true if you want to use private DNS within the VPC"
  default     = "false"
}

variable "subnet_public1_cidr" {}
variable "subnet_public2_cidr" {}
variable "subnet_public3_cidr" {}
variable "subnet_public4_cidr" {}
variable "subnet_web_private1_cidr" {}
variable "subnet_web_private2_cidr" {}
variable "subnet_web_private3_cidr" {}
variable "subnet_web_private4_cidr" {}
variable "subnet_appserver_private1_cidr" {}
variable "subnet_appserver_private2_cidr" {}
variable "subnet_appserver_private3_cidr" {}
variable "subnet_appserver_private4_cidr" {}
variable "subnet_dbserver_private1_cidr" {}
variable "subnet_dbserver_private2_cidr" {}
variable "subnet_dbserver_private3_cidr" {}
variable "subnet_dbserver_private4_cidr" {}
variable "subnet_webelb_private1_cidr" {}
variable "subnet_webelb_private2_cidr" {}
variable "subnet_appelb_private1_cidr" {}
variable "subnet_appelb_private2_cidr" {}

/*
variable "hosted_zone_name" {}

variable "cgw_peer_ip" {}
variable "cgw_vpn_static_routes" {}

variable "mgmt_vpc_id" {}
variable "mgmt_vpc_cidr" {}

variable "s3_bucket_name" {}
*/