variable "user_name" {
  type = string

  validation {
    condition     = length(var.user_name) >= 3
    error_message = "User name must be >= 3 characters."
  }
}

variable "policy_statements" {
  type = list(object({
    preset    = optional(string)
    actions   = optional(list(string))
    resources = optional(list(string))
    buckets   = list(string)
  }))

  validation {
    condition = alltrue([
      for s in var.policy_statements : contains(["consoleAdmin", "readwrite", "writeonly", "readonly", "diagnostics"], s.preset)
    ])
    error_message = "If 'preset' is provided, it must be either 'consoleAdmin', 'readwrite', 'writeonly', 'readonly', 'diagnostics'."
  }

  validation {
    condition = alltrue([
      for s in var.policy_statements : (
        (
          length(s.preset) == 0 || try(length(s.actions), 0) == 0
          ) && (
        length(s.preset) != try(length(s.actions), 0))
      )
    ])
    error_message = "Each statement must have either 'preset' or 'actions' set, but not both. One of them must be empty."
  }

  validation {
    condition = alltrue([
      for v in var.policy_statements : length(v.buckets) > 0
      ])
    error_message = "Each object in the list must have at least one bucket in the 'buckets' field."
  }
}

variable "password_store_paths" {
  type        = list(string)
  description = "Paths to write the credentials to."
}

variable "bucket_arns" {
  type = map(string)
}
