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
| [aws_iam_access_key.example_access_key](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_policy) | resource |
| [aws_iam_user.s3_user](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.attachment](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_policy_document.policy](https://registry.terraform.io/providers/hashicorp/aws/5.71.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_arns"></a> [bucket\_arns](#input\_bucket\_arns) | n/a | `map(string)` | n/a | yes |
| <a name="input_password_store_paths"></a> [password\_store\_paths](#input\_password\_store\_paths) | Paths to write the credentials to. | `list(string)` | n/a | yes |
| <a name="input_policy_statements"></a> [policy\_statements](#input\_policy\_statements) | n/a | <pre>list(object({<br/>    preset    = optional(string)<br/>    actions   = optional(list(string))<br/>    resources = optional(list(string))<br/>    buckets   = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_keys"></a> [access\_keys](#output\_access\_keys) | n/a |
| <a name="output_password_store_paths"></a> [password\_store\_paths](#output\_password\_store\_paths) | n/a |
<!-- END_TF_DOCS -->