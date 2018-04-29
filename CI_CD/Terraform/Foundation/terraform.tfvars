# Environment identifier to be added to name of all the resources
name  = "ccs-demo"
region = "us-east-1"
key_name = "demo-ssh-key"

# VPC CIDR and DNS properties
vpc_cidr = "10.1.0.0/16"
enable_dns_hostnames = "true"
enable_dns_support = "true"

# Subnet CIDRs
subnet_public1_cidr = "10.1.1.0/24"
subnet_public2_cidr = "10.1.2.0/24"
subnet_public3_cidr = "10.1.3.0/24"
subnet_public4_cidr = "10.1.4.0/24"

subnet_web_private1_cidr = "10.1.5.0/24"
subnet_web_private2_cidr = "10.1.6.0/24"
subnet_web_private3_cidr = "10.1.7.0/24"
subnet_web_private4_cidr = "10.1.8.0/24"

subnet_appserver_private1_cidr = "10.1.9.0/24"
subnet_appserver_private2_cidr = "10.1.10.0/24"
subnet_appserver_private3_cidr = "10.1.11.0/24"
subnet_appserver_private4_cidr = "10.1.12.0/24"

subnet_dbserver_private1_cidr = "10.1.13.0/24"
subnet_dbserver_private2_cidr = "10.1.14.0/24"
subnet_dbserver_private3_cidr = "10.1.15.0/24"
subnet_dbserver_private4_cidr = "10.1.16.0/24"

subnet_webelb_private1_cidr = "10.1.17.0/24"
subnet_webelb_private2_cidr = "10.1.18.0/24"

subnet_appelb_private1_cidr = "10.1.19.0/24"
subnet_appelb_private2_cidr = "10.1.20.0/24"

### Uncomment based on requirement. Need to uncomment code in respective configuration files as well as variables.tf file.

# Route53 hosted zone name
#hosted_zone_name = ""

# Customer Gateway parameters
#cgw_peer_ip = ""
#cgw_vpn_static_routes = ""

# VPC ID of management VPC
#mgmt_vpc_id = ""
# VPC CIDR of management VPC
#mgmt_vpc_cidr=""

# Name of S3 bucket. 
#s3_bucket_name = ""	
