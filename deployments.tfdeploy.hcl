# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "production" {
  inputs = {
    region              = "us-west-2"
    availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
    role_arn            = "arn:aws:iam::798714130597:role/stacks-hashicorp-kranthi-Demo-vpc-ec2-stack"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "vpc-ec2-stack" }

    #key_pair_name       = "<Set to the name of an imported SSH key pair (in AWS console under EC2->Key Pairs)>"
  }
}
