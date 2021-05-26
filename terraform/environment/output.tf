output "env" {
  value = local.environment
}

output "instance_ip" {
  value = module.ec2_instance.instance_ip
}

output "access_key" {
  value = module.service_iam.iam_access_key_id
}

output "iam_access_key_secret" {
  value = module.service_iam.iam_access_key_secret
  sensitive = true
}
output "repository_url" {
  value = module.ecr.repository_url
}

