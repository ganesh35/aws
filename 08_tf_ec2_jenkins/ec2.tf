data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*20.04*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

# Key Pair
resource "aws_key_pair" "default" {
  key_name   = var.keyname
  public_key = var.public_key
}

resource "aws_instance" "webserver" {
  ami                    = data.aws_ami.ubuntu.id
  availability_zone      = "${var.aws_region}a"
  instance_type          = var.instance_type
  key_name = var.keyname
  vpc_security_group_ids = [aws_security_group.allowall.id]
  subnet_id              = aws_subnet.main.id
  tags = {
    Name = "${var.stack}-${var.env}-instance"
  }
}


output "public_ip" {
  value = aws_eip.webserver.public_ip
}

output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "key_pair" {
  value = aws_key_pair.default.id
}

# terraform import aws_key_pair.default tf-jenkins-aws