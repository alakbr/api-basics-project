

data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {

    name = "name"

    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]

  }

}

resource "aws_instance" "api_server" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  security_groups = [
    aws_security_group.web.name
  ]

  user_data = file("${path.module}/user-data.sh")

  tags = {

    Name = "node-api"

  }

}

resource "aws_security_group" "web" {

  name = "node-api"

  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

}