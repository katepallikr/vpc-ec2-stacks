# vpc-ec2-stack

_This is an example stack configuration for the private preview of Terraform Stacks. Language
constructs and features are subject to change given feedback received during this preview. Do not
use Stacks for production workloads at this time._

TODO: Image

This stack provisions an AWS virtual private cloud (VPC) using three availability zones and with six
subnets using the popular AWS VPC Terraform module. An EC2 instance running the latest Ubuntu AMI is
then provisioned within each subnet. 

Two components are used:

* `vpc` uses the popular AWS VPC Terraform module to provision an AWS virtual private network, with
  various subnets.
* `ec2` uses the created VPC's ID to fetch the subnets and provision an EC2 instance running Ubuntu
  within each. Initially, the planning of changes for this component will be _deferred_, and will be
  subsequently planned after the initial apply provisioning the `vpc` component infrastructure.

Without Terraform's new concept of _deferred changes_, the configuration here would fail as follows:

![CleanShot 2024-01-10 at 14 35 36](https://github.com/hashicorp/vpc-ec2-stack/assets/2430490/78c67a81-2647-4797-949b-b191b80edeaf)

Although there are ways in current-day Terraform to avoid the error in this specific example (you
can directly reference the subnets from the VPC module instead of using a data source to query them
separately after creation, or you can use tedious resource targeting to manually hide the EC2 infrastructure
from Terraform until appropriate), this example demonstrates the broader concept of _deferred changes_
clearly: Terraform understands that in order to fetch the appropriate subnets in one component, a
partial plan must be applied and the stack replanned afterward to resolve unknown values only known
after apply. Replanning continues until the all resources are applied no further changes are
necessary, at which point the configuration is considered _converged_.

_We do not recommend using this example within production accounts. This example will incur [small]
costs if provisioned. Please remember to destroy the infrastructure after using this example._

## Usage

TODO
