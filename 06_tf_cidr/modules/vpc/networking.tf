resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.tenancy
  tags = {
    "Name" = "main"
  }
}

resource "aws_subnet" "main" {
  count = 3
  vpc_id     = var.vpc_id
  // cidr_block = var.subnet_cidr
  cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
  tags = {
    "Name" = "${var.profile}-${var.env}-Subnet-${count.index + 1}"
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}
/*
output "subnet_id" {
   value = aws_subnet.main.id

}*/