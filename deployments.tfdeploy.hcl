identity_token "aws" {
  audience = ["<Set to your AWS IAM assume-role audience>"]
}

deployment "production" {
  variables = {
    region              = "us-west-2"
    availability_zones  = ["us-west-2a", "us-west-2b", "us-west-2c"]
    role_arn            = "<Set to your AWS IAM OIDC role ARN>"
    identity_token_file = identity_token.aws.jwt_filename
  }
}
