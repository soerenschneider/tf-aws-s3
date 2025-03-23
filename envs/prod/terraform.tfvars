buckets = [
  {
    name = "soerenschneider-taskwarrior-prod",
    versioning = {
      enabled = false,
    }
  }
]

users = [
  {
    user_name = "taskwarrior-prod-soeren"
    password_store_paths = ["users/soeren/aws/s3/taskwarrior-prod"]
    statements = [
      {
        preset  = "readwrite"
        buckets = ["soerenschneider-taskwarrior-prod"]
      }
    ]
  },
  {
    user_name = "taskwarrior-prod-aether"
    statements = [
      {
        preset  = "readwrite"
        buckets = ["soerenschneider-taskwarrior-prod"]
      }
    ]
  }
]
