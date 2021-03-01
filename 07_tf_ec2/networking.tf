resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true
  instance_tenancy = var.tenancy
  tags = {
    "Name" = "${var.stack}-${var.env}-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  tags = {
    "Name" = "${var.stack}-${var.env}-subnet"
  }
}


output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}
