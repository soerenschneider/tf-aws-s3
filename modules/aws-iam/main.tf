locals {
  presets = {
    consoleAdmin = [
      "s3:*",
      "admin:*"
    ]
    readwrite = [
      "s3:*"
    ]
    writeonly = [
      "s3:PutObject"
    ]
    readonly = [
      "s3:GetBucketLocation",
      "s3:GetObject",
      "s3:ListBucket"
    ],
    diagnostics = [
      "admin:ServerTrace",
      "admin:Profiling",
      "admin:ConsoleLog",
      "admin:ServerInfo",
      "admin:TopLocksInfo",
      "admin:OBDInfo",
      "admin:BandwidthMonitor",
      "admin:Prometheus"
    ]
  }
}

locals {
  resources_default = "arn:aws:s3:::*"
}

data "aws_iam_policy_document" "policy" {
  dynamic "statement" {
    for_each = var.policy_statements
    content {
      actions = coalesce(statement.value["actions"], local.presets[statement.value["preset"]])
      resources = toset(
        coalescelist(
          concat(
            # 1. first concat resources and buckets
            coalesce(statement.value["resources"], []),
            [
              for bucket in coalesce(statement.value["buckets"], []) : "arn:aws:s3:::${var.bucket_arns[bucket]}"
            ],
            [
              for bucket in coalesce(statement.value["buckets"], []) : "arn:aws:s3:::${var.bucket_arns[bucket]}/*"
            ]
          ),
          # 2. if they're both empty, use the default resource
          [local.resources_default]
        )
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
