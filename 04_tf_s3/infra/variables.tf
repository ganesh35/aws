# variables.tf
variable "aws_region" {
  description = "The AWS region things are created in"
  default     = "eu-central-1"
}

variable "env" {
  description = "Environment variable"
  default     = "test"
}

variable "bucket_name" {
  description = "Name of the bucket"
  default     = "hello"
}