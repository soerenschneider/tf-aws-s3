variable "buckets" {
  type = list(object({
    name          = optional(string)
    bucket_prefix = optional(string)
    force_destroy = optional(bool)

    object_lock_configuration = optional(object({
      years = optional(number)
      days  = optional(number)
      mode  = optional(string)
    }))

    versioning = optional(object({
      enabled           = optional(bool, true)
      exclude_folders   = optional(bool, false)
      excluded_prefixes = optional(list(string), [])
      }))

    lifecycle_rules = optional(list(object({
      enabled = optional(bool, true)
      id      = string

      abort_incomplete_multipart_upload_days = optional(number)

      # `filter_and` is the `and` configuration block inside the `filter` configuration.
      # This is the only place you should specify a prefix.
      filter_and = optional(object({
        object_size_greater_than = optional(number) # integer >= 0
        object_size_less_than    = optional(number) # integer >= 1
        prefix                   = optional(string)
        tags                     = optional(map(string), {})
      }))

      expiration = optional(object({
        date                         = optional(string) # string, RFC3339 time format, GMT
        days                         = optional(number) # integer > 0
        expired_object_delete_marker = optional(bool)
      }))

      noncurrent_version_expiration = optional(object({
        newer_noncurrent_versions = optional(number) # integer > 0
        noncurrent_days           = optional(number) # integer >= 0
      }))

      transition = optional(list(object({
        date          = optional(string) # string, RFC3339 time format, GMT
        days          = optional(number) # integer > 0
        storage_class = optional(string)
        # string/enum, one of GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
      })), [])

      noncurrent_version_transition = optional(list(object({
        newer_noncurrent_versions = optional(number) # integer >= 0
        noncurrent_days           = optional(number) # integer >= 0
        storage_class             = optional(string)
        # string/enum, one of GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.
      })), [])
    })))
  }))
}

variable "users" {
  type = list(object({
    user_name = string,
    statements = list(object({
      preset    = optional(string)
      resources = optional(list(string))
      buckets   = optional(list(string))
    }))
    password_store_paths = optional(list(string))
  }))
}

variable "password_store_paths" {
  type        = list(string)
  default     = []
  description = "Password storage path"
}
