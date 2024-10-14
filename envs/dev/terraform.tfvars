password_store_paths = ["soeren.cloud/env/prod/aws-s3/%s"]

buckets = [
  {
    name = "z8ewfhas9df8hsas",
    versioning = {
      enabled = true,
    }
    lifecycle_rules = [
      {
        id = "test"
        abort_incomplete_multipart_upload_days = 1,
        expiration = {
          days = 7
        }
      }
    ]
  }
]

users = [
  {
    user_name = "user-xxx"
    statements = [
      {
        preset  = "readwrite"
        buckets = ["z8ewfhas9df8hsas"]
      }
    ]
  }
]
