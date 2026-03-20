# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [Unreleased]

## [0.2.0] - 2026-03-20

### Added

- `versions.tf` with `required_version >= 1.0`
- `kms_alias_name` variable to make KMS alias configurable
- `bucket_arn`, `bucket_id`, `kms_key_arn` outputs
- Usage example in `examples/simple/`
- GitHub Actions CI (`terraform fmt -check`, `terraform validate`, `terraform test`)
- `.gitignore`
- Terraform tests with mock provider (8 test cases)

### Changed

- Extracted `terraform {}` block from `main.tf` into `versions.tf`

## [0.1.0] - 2021-12-19

### Added

- Initial release
- S3 bucket with versioning enabled
- SSE-KMS encryption with dedicated KMS key
- Bucket policy to deny non-SSL transport
- Public access block (all four restrictions enabled)
- Support for AWS provider `~> 5.0`
