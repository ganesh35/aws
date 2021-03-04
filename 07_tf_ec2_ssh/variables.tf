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
variable "keyname" {
  description = "Keyname for SSH access"
  default     = "tf-jenkins-aws"
}
variable "public_key" {
  description = "Public key for SSH access"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoVWY56ivcQaZ4ZBSYzlUQNsM5zuDxlSURYNwjf7JN+Q6ez9n1fo81LgUW/FIuur0vkiKP6vbmy5T2XNpyuPNM73ADefsJdfr2SKNCTn438AzQv5qwihD7YQfZ0iGyIQWudrJkI+pY+DkSQ+S4gH0255flQMPvN+KPhp7OBjsrPhXM4aUHbYwfS3IMmfqpBgZM5/+BHNbv22eE/Zpddy1GVvNcndFkigmcenco6Mw0ZiUqNa1P0VuYb8eSFJZaYpRHaahnuzka64rWsB+II8w/dA7ASMgeMFVUyJPJMYFwz/BNX1E0VEbHQhduzXycDb+wyNlB+ASUL00ywfYUzikWw== rsa-key-20210304"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

