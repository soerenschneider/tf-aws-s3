locals {
  instance                     = basename(abspath(path.module))
  password_store_paths_default = ["env/${local.instance}/aws-s3/credentials/%s"]
}

module "buckets" {
  for_each        = { for bucket in var.buckets : coalesce(bucket.name, bucket.bucket_prefix) => bucket }
  source          = "../../modules/aws-s3"
  bucket_name     = each.value.name
  bucket_prefix   = each.value.bucket_prefix
  force_destroy   = each.value.force_destroy
  object_lock_configuration = each.value.object_lock_configuration
  versioning      = each.value.versioning
  lifecycle_rules = each.value.lifecycle_rules
}

module "users" {
  for_each             = { for user in var.users : user.user_name => user }
  source               = "../../modules/aws-iam"
  user_name            = each.key
  policy_statements    = each.value.statements
  password_store_paths = each.value.password_store_paths

  bucket_arns = {
    for bucket in var.buckets : bucket.name => module.buckets[bucket.name].arn
  }
}

module "vault" {
  for_each             = { for user in var.users : user.user_name => user }
  source               = "../../modules/vault"
  access_keys          = nonsensitive(module.users[each.value.user_name].access_keys)
  password_store_paths = coalescelist(each.value.password_store_paths, var.password_store_paths, local.password_store_paths_default)
  metadata             = {}
}
