# tf-aws-s3

![gitleaks](https://github.com/soerenschneider/tf-aws-s3/actions/workflows/gitleaks.yaml/badge.svg)
![lint-workflow](https://github.com/soerenschneider/tf-aws-s3/actions/workflows/lint.yaml/badge.svg)
![security-workflow](https://github.com/soerenschneider/tf-aws-s3/actions/workflows/security.yaml/badge.svg)

This repository implements Infrastructure as Code (IaC) using [OpenTofu](https://opentofu.org/) to configure Minio instances and write user credentials to Hashicorp Vault.

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)

## Getting Started

Follow these instructions to set up the repository and start managing your Minio and Vault resources.

### Prerequisites

- [OpenTofu](https://opentofu.org/)
- Terragrunt
- Docker-compose

### Running the code

1. **Clone the repository:**
   ```bash
   git clone https://github.com/soerenschneider/tf-aws-s3.git
   cd tf-aws-s3
   ```

2. **Provisioning resources:**
   ```bash
   cd envs/dev
   bash run.sh
   ```
