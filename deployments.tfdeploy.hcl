identity_token "aws" {
  audience = ["<Set to your AWS IAM assume-role audience>"]
}

deployment "production" {
  variables = {
    region              = "us-west-2"
    availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
    role_arn            = "<Set to your AWS IAM OIDC role ARN>"
    identity_token_file = identity_token.aws.jwt_filename
    default_tags      = { stacks-preview-example = "vpc-ec2-stack" }

    key_pair_name       = "<Set to the name of an imported SSH key pair (in AWS console under EC2->Key Pairs)>"
  }
}
