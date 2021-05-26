variable "name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_ports" {
  type = list(number)
  default = [22, 80, 443]
}

variable "whitelisted_cidrs" {
  type = list(string)
  default = []
}

variable "travis_cidrs" {
  type = list(string)
  default = []
}

variable "private_cidrs" {
  type = list(string)
  default = []
}
