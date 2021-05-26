
# Reasonably open SG (only necessary ports)
resource "aws_security_group" "this_public_security_group" {
  vpc_id = var.vpc_id
  name = "${var.name}-public"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.whitelisted_cidrs
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = var.whitelisted_cidrs
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = var.whitelisted_cidrs
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  tags = {
    Name = "${var.name}_public_security_group_true"
  }
}
