output "vpc_id" {
  description = "The ID of the VPC created."

  value = module.vpc.vpc_id
}
