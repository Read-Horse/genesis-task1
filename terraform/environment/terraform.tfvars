# General
project_name = "test"
# AWS
aws_access_key = "KEY"
aws_secret_key = "SECRET"
aws_region = "eu-central-1"
# VPC
vpc_cidr = "10.0.0.0/25" # More about CIDR: https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing
vpc_subnets_cidrs = { public = "10.0.0.0/27", private = "10.0.0.32/27" }
# Security group
public_ports = [22, 80, 443, 8080] # Port to be open publically
#EC2
instance_ssh_key_path = "./id_rsa.pub"
instance_volume_size = 20
