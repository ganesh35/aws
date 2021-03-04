data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name = "name"
    values = [
      "amzn2-ami-hvm-*-x86_64-gp2",
    ]
  }
  filter {
    name = "owner-alias"
    values = [
      "amazon",
    ]
  }
}
/*
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
*/
# Key Pair
resource "aws_key_pair" "default" {
  key_name   = var.keyname
  public_key = var.public_key
}

resource "aws_instance" "webserver" {
  //ami                    = data.aws_ami.ubuntu.id
  ami                    = data.aws_ami.amazon-linux-2.id
  availability_zone      = "${var.aws_region}a"
  instance_type          = var.instance_type
  key_name               = var.keyname
  vpc_security_group_ids = [aws_security_group.allowall.id]
  subnet_id              = aws_subnet.main.id
  //user_data = file("install_jenkins_ubuntu.sh")
  user_data = file("install_jenkins.sh")
  tags = {
    Name = "${var.stack}-${var.env}-instance"
  }
}


output "public_ip" {
  value = aws_eip.webserver.public_ip
}

output "ami_id" {
  // value = data.aws_ami.ubuntu.id
  value = data.aws_ami.amazon-linux-2.id
}

output "key_pair" {
  value = aws_key_pair.default.id
}

# terraform import aws_key_pair.default tf-jenkins-aws