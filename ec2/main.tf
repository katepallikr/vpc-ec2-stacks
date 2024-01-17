data "aws_subnets" "dev_subnet" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    "Environment" = "terraform-stacks-preview*"
  }
}

# Create an EC2 instance running Ubuntu in each subnet
resource "aws_instance" "example" {
  for_each = toset(data.aws_subnets.dev_subnet.ids)

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name = var.key_pair_name
  associate_public_ip_address = true
}

# Create a security group that allows SSH access to the EC2 instances
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
