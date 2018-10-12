provider "aws" {
  region  = "us-east-1"
  profile = ""
}

module "vpc" {
  source = "../"

  #VPC Vars
  name              = "terraform-test-vpc"
  vpc_cidr          = "10.111.0.0/20"
  public_subnets    = ["10.111.4.0/25", "10.111.4.128/25"]
  private_subnets   = ["10.111.0.0/23", "10.111.2.0/23"]
  database_subnets = ["10.111.5.0/25", "10.111.5.128/25"]

  #Route53
  zone_name = "test.devops.bharat.internal."

   #tagging
  tags {
    Environment = "test"
  }
}
