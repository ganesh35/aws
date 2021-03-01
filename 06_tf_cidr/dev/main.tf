
// Variable declaration
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "eu-central-1"
}
variable "env" {
  description = "Environment variable"
  default     = "test"
}

variable "profile" {
  description = "Profile for shared credentials"
  default     = "default"
}


provider "aws" {
  region                    = var.aws_region
  shared_credentials_file   = "%USERPROFILE%/.aws/credentials"
  profile                   = var.profile
}
module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = module.my_vpc.vpc_id
  subnet_cidr = "192.168.1.0/24"
  env = "test"
  profile = "dyn_cidr_blocks"
}
