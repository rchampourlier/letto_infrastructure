# Letto (infrastructure)

Infrastructure-as-code for Letto.

## Prerequisites

- Terraform
- [pass](https://www.passwordstore.org/)
- AWS credentials with administrator rights stored in pass, under `aws/letto/terraform/id` and `aws/letto/terraform/secret`.
- A S3 bucket named `terraform` to be used as Terraform's backend. It is recommended to have activated versioning on this bucket so that Terraform states are versioned by default.
- Packer

## Howto

```
terraform init
bin/run_with_env terraform apply 2>&1 # or simply bin/deploy
```
