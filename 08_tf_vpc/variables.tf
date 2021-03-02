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

variable "vpc_cidr" {
  description = "Cidr block for VPC"
  default     = "10.1.0.0/16"
}

variable "subnet_cidr" {
  description = "Cidr block for Subnet"
  default     = "10.1.1.0/24"

}
