# variables.tf
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "eu-central-1"
}

variable "env" {
  description = "Environment variable"
  default     = "test"
}