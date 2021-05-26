output "public-security-group-id" {
  value = aws_security_group.this_public_security_group.id
}

output "es-security-group-id" {
  value = aws_security_group.es_security_group.id
}
