variable "vpc_id" {
  description = "The VPC ID created by the previous component"
  type = string
}

variable "key_pair_name" {
  description = "A key pair name to use for the purposes of SSH login to EC2 instances. You can import your own key in the AWS console under EC2-> Key Pairs -> Import Key Pair"
  type = string
}

