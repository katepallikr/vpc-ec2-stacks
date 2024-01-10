component "vpc" {
  source = "./vpc"

  inputs = {
  }

  providers = {
    aws    = provider.aws.this
  }
}

component "ec2" {
  source = "./ec2"

  inputs = {
    vpc_id = component.vpc.vpc_id
  }

  providers = {
    aws     = provider.aws.this
  }
}
