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
    user_name            = "taskwarrior-prod-soeren-desktop"
    password_store_paths = ["users/soeren/aws/s3/taskwarrior-prod-desktop"]
    statements = [
      {
        preset  = "readwrite"
        buckets = ["soerenschneider-taskwarrior-prod"]
      }
    ]
  },
  {
    user_name            = "taskwarrior-prod-soeren-macos"
    password_store_paths = ["users/soeren/aws/s3/taskwarrior-prod-macos"]
    statements = [
      {
        preset  = "readwrite"
        buckets = ["soerenschneider-taskwarrior-prod"]
      }
    ]
  },
  {
    user_name            = "taskwarrior-prod-soeren-android"
    password_store_paths = ["users/soeren/aws/s3/taskwarrior-prod-android"]
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
