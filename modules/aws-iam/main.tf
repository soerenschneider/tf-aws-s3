locals {
  presets = {
    consoleAdmin = [
      "s3:*",
      "admin:*"
    ]
    readwrite = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:DeleteObject"
    ]
    writeonly = [
      "s3:PutObject"
    ]
    readonly = [
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket"
    ],
  }
}

data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      actions = coalesce(statement.value["actions"], local.presets[statement.value["preset"]])
      resources = toset(
          concat(
            # 1. first concat resources and buckets
            coalesce(statement.value["resources"], []),
            [
              for bucket in coalesce(statement.value["buckets"], []) : var.bucket_arns[bucket]
            ],
            [
              for bucket in coalesce(statement.value["buckets"], []) : "${var.bucket_arns[bucket]}/*"
            ]
          ),
        )
    }
  }
}

resource "aws_iam_policy" "policy" {
  name   = "user-${var.user_name}"
  policy = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_user_policy_attachment" "attachment" {
  user       = aws_iam_user.s3_user.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_user" "s3_user" {
  name = var.user_name
  path = "/system/tf-aws-s3/"
}

resource "aws_iam_access_key" "example_access_key" {
  user = aws_iam_user.s3_user.name
}
