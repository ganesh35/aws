# vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" = "${var.stack}-${var.env}-vpc"
  }
}

# Internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Subnet
resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr
  availability_zone = "${var.aws_region}a"
}

# Route
resource "aws_route_table" "default" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}
# Route table association
resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.default.id
}

# entwork acl  (Allow all)
resource "aws_network_acl" "allowall" {
  vpc_id = aws_vpc.main.id
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    protocol   = "-1"
    rule_no    = 100
    to_port    = 0
  }
  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    protocol   = "-1"
    rule_no    = 200
    to_port    = 0
  }
}


# Security Group
resource "aws_security_group" "allowall" {
  name        = "Allow all Traffic"
  description = "Allow all traffic - most unsecure"
  vpc_id      = aws_vpc.main.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
  }
}

# Elastic IP
resource "aws_eip" "webserver" {
  instance   = aws_instance.webserver.id
  vpc        = true
  depends_on = [aws_internet_gateway.main]
}


output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}
