resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  bucket_prefix = var.bucket_prefix
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_versioning" "versioning" {
  count = var.versioning.enabled ? 1 : 0

  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = var.versioning.enabled ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "locking" {
  count = var.object_lock_configuration != null ? 1 : 0

  bucket = aws_s3_bucket.bucket.id
  rule {
    default_retention {
      mode  = try(var.object_lock_configuration.mode, "GOVERNANCE")
      days  = try(var.object_lock_configuration.days, null)
      years = try(var.object_lock_configuration.years, null)
    }
  }
}
