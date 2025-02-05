#!/usr/bin/env bash

set -e

TF_ENCRYPTION=$(cat <<EOF
key_provider "pbkdf2" "mykey" {
  passphrase = "somekeynotverysecure"
}
EOF
)
export TF_ENCRYPTION

tofu init
tofu apply -auto-approve
