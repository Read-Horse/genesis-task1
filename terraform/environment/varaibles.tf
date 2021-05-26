variable "workspace_to_environment_map" {
  type = map

  default = {
    dev     = "dev"
    staging = "staging"
    prod    = "prod"
  }
}

variable "environment_to_size_map" {
  type = map

  default = {
    dev     = "micro"
    staging = "small"
    prod    = "small"
  }
}

variable "project_name" {
  type = string
}


variable "aws_access_key" {
  type = string
}

variable "aws_secret_key" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/25"
}

variable "public_ports" {
  type = list(string)
  default = [
    80,
    443,
    22
  ]
}

variable "travis_cidrs" {
  type    = list(string)
  default = [
  "34.66.25.221/32",
  "34.66.50.208/32",
  "34.66.178.120/32",
  "34.66.200.49/32",
  "34.68.144.114/32",
  "35.184.226.236/32",
  "35.188.1.99/32",
  "35.188.15.155/32",
  "35.188.73.34/32",
  "35.192.10.37/32",
  "35.192.85.2/32",
  "35.192.91.101/32",
  "35.192.136.167/32",
  "35.192.187.174/32",
  "35.193.7.13/32",
  "35.193.14.140/32",
  "35.202.145.110/32",
  "35.202.245.105/32",
  "35.222.7.205/32",
  "35.224.112.202/32",
  "104.154.113.151/32",
  "104.154.120.187/32",
  "104.197.122.201/32",
  "104.198.131.58/32",
  "34.73.34.132/32",
  "34.73.65.1/32",
  "34.73.66.97/32",
  "34.74.79.111/32",
  "34.74.91.53/32",
  "34.74.253.255/32",
  "35.185.97.135/32",
  "35.196.72.151/32",
  "35.196.82.30/32",
  "35.196.158.85/32",
  "35.227.58.83/32",
  "35.227.97.188/32",
  "35.231.58.0/32",
  "35.237.8.208/32",
  "35.237.56.208/32",
  "35.237.212.185/32",
  "104.196.57.92/32",
  "104.196.213.122/32"
  ]
}

variable "whitelisted_cidrs" {
  type    = list(string)
  default = [
    "194.183.167.110/32",
    "91.225.165.99/32",
    "0.0.0.0/0"
  ]
}


variable "instance_ssh_key_path" {
  type = string
}

variable "instance_volume_size" {
  type = number
}


