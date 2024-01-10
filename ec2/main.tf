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
}
