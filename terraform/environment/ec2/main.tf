resource "aws_iam_role" "this_ec2_access_role" {
  name = "${var.env}-access-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "this_instance_profile" {
  role = aws_iam_role.this_ec2_access_role.name
}

resource "aws_key_pair" "this_key_pair" {
  key_name = "${var.project_name}-${var.env}-key"
  public_key = file(var.ssh_key_path)
}

resource "aws_instance" "this_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  key_name = aws_key_pair.this_key_pair.key_name

  subnet_id = var.subnet_id
  iam_instance_profile = aws_iam_instance_profile.this_instance_profile.name

  vpc_security_group_ids = var.security_groups

  root_block_device {
    delete_on_termination = false
    volume_size = var.volume_size
  }

  tags = {
    Name = "${var.project_name}_${var.env}_instance"
    Terraform = true
    Enviroment = var.env
    Project = var.project_name
  }

}

resource "aws_eip" "this_ip" {
  vpc = true
  instance = aws_instance.this_instance.id
  tags = {
    Name = "${var.project_name}_${var.env}_eip_true"
    Terraform = true
    Enviroment = var.env
    Project = var.project_name
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

