# variables.tf
variable "stack" {
  description = "Name of the stack"
  default     = "jenkins"
}

variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "eu-central-1"
}

variable "env" {
  description = "Environment variable"
  default     = "test"
}

variable "keyname" {
  description = "Keyname for SSH access"
  default = "tf-jenkins-aws"
}

variable instance_type{
  description = "Instance type"
  default = "t2.micro"
} 

variable "vpc_cidr" {
  description = "Cidr block for VPC"
  default = "192.168.0.0/16"
}

variable "tenancy" {
  description = "Tenanancy value for vpc"
  default = "default"
}

variable "subnet_cidr" {
  description = "Cidr block for Subnet"
  default = "192.168.1.0/24"

}
