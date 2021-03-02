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
  description = "Keypair Key name"
  default     = "tf-jenkins-aws"
}
variable "public_key" {
  description = "Keypair Public key"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDSHhSHZXbbMc71krTkdnbkuyxMY37+yvzgR61ZxTpqSS/a7IV2LOEGqv2e058hy/LNWmn7eEG2J5AoEOj7SPjM1olM9fBWutSMzCrbztu2ri7Vh5I36XdIsUL9h/vPetTkdPDZTaiOhucUrbBULP6xBsTEPITnnz2tMQO8A6i7qcgLx0PTgNv5Z1Ga+50sKVqSZFZEbOtDoplRUUr9AW0VeUE5hOcxR1RyVAfKCtZ1VerjuRzfuUJAxkVEaDTskrp3HozKxugRXb3haCAeNtSiywVCAkvFSLxZtIzbgBpxZa2JGj7pR/8aHseqynJ7Zq8Wk2iyw6f0aG25eSXmzght9RyP5/P1I5adYRxQnRjpU8VLk9UiyM33D/WHfQL8OTqLhhYHKewLbbzoVd2cGFBEY9v80Y1vDKVDtJjitNNfRCNa214b3zXLUrXsUc3+Qol6dsV7/mfE5k2jArX6J0TDqt58Qb7Ed4VjS9PgZFM52ph4JnbKc1wYwODsVUWK1wk= ganes@DESKTOP-U5B1DQH"
}
variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

