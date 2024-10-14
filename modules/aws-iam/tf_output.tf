output "access_keys" {
  value = {
    name       = aws_iam_user.s3_user.name
    access_key = aws_iam_access_key.example_access_key.id
    secret_key = aws_iam_access_key.example_access_key.secret
  }
}

output "password_store_paths" {
  value = var.password_store_paths
}
