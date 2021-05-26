terraform {
  backend "s3" {
    bucket = "terraform-state-bucket"
    key = "dev/state.tfstate"
    encrypt = true
  }
}

locals {
  environment = "${lookup(var.workspace_to_environment_map, terraform.workspace, "dev")}"
  size = "${lookup(var.environment_to_size_map, terraform.workspace, "small")}"
}

# VPC
module "vpc" {
  source = "./vpc"
  name = var.project_name
  env = local.environment
  cidr = var.vpc_cidr
  availability_zones = [
    "${var.aws_region}a",
    //"${var.aws_region}b",
  ]
  aws_region = var.aws_region
}

# Security groups
module "security_groups" {
  source = "./security_group"
  name = var.project_name
  vpc_id = module.vpc.vpc-id
  public_ports = var.public_ports
  whitelisted_cidrs = flatten([
    module.vpc.private-subnet-cidrs,
    module.vpc.public-subnet-cidrs,
    var.whitelisted_cidrs,
  ])
  travis_cidrs = flatten([
    var.travis_cidrs
  ])
  private_cidrs = flatten([
    "${module.ec2_instance.instance_private_ip}/32"
  ])
}


module "ec2_instance" {
  source = "./ec2"
  project_name = var.project_name
  env = local.environment
  instance_type = "t3.${local.size}"
  subnet_id = module.vpc.public-subnet-ids[0]
  ssh_key_path = var.instance_ssh_key_path
  volume_size = var.instance_volume_size
  security_groups = [
    module.security_groups.public-security-group-id]
  vpc_id = module.vpc.vpc-id
}
