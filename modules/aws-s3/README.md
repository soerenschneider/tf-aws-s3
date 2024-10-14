<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.71.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.71.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.lifecycle](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_object_lock_configuration.locking](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/s3_bucket_object_lock_configuration) | resource |
| [aws_s3_bucket_versioning.versioning](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Specifies the name of the bucket. Can not be used together with 'bucket\_prefix'. | `string` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Specifies the name of the bucket. Can not be used together with 'bucket\_name'. | `string` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | n/a | `bool` | `false` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | A list of lifecycle V2 rules | <pre>list(object({<br/>    enabled = optional(bool, true)<br/>    id      = string<br/><br/>    abort_incomplete_multipart_upload_days = optional(number)<br/><br/>    # `filter_and` is the `and` configuration block inside the `filter` configuration.<br/>    # This is the only place you should specify a prefix.<br/>    filter_and = optional(object({<br/>      object_size_greater_than = optional(number) # integer >= 0<br/>      object_size_less_than    = optional(number) # integer >= 1<br/>      prefix                   = optional(string)<br/>      tags                     = optional(map(string), {})<br/>    }))<br/><br/>    expiration = optional(object({<br/>      date                         = optional(string) # string, RFC3339 time format, GMT<br/>      days                         = optional(number) # integer > 0<br/>      expired_object_delete_marker = optional(bool)<br/>    }))<br/><br/>    noncurrent_version_expiration = optional(object({<br/>      newer_noncurrent_versions = optional(number) # integer > 0<br/>      noncurrent_days           = optional(number) # integer >= 0<br/>    }))<br/><br/>    transition = optional(list(object({<br/>      date          = optional(string) # string, RFC3339 time format, GMT<br/>      days          = optional(number) # integer > 0<br/>      storage_class = optional(string)<br/>      # string/enum, one of GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.<br/>    })), [])<br/><br/>    noncurrent_version_transition = optional(list(object({<br/>      newer_noncurrent_versions = optional(number) # integer >= 0<br/>      noncurrent_days           = optional(number) # integer >= 0<br/>      storage_class             = optional(string)<br/>      # string/enum, one of GLACIER, STANDARD_IA, ONEZONE_IA, INTELLIGENT_TIERING, DEEP_ARCHIVE, GLACIER_IR.<br/>    })), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_object_lock_configuration"></a> [object\_lock\_configuration](#input\_object\_lock\_configuration) | n/a | <pre>object({<br/>    years = optional(number)<br/>    days  = optional(number)<br/>    mode  = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | n/a | <pre>object({<br/>    enabled           = bool<br/>    exclude_folders   = optional(bool, false)<br/>    excluded_prefixes = optional(list(string), [])<br/>  })</pre> | <pre>{<br/>  "enabled": false<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->