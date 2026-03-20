mock_provider "aws" {}

variables {
  bucket_name = "test-terraform-backend"
}

run "creates_bucket_with_given_name" {
  command = plan

  assert {
    condition     = aws_s3_bucket.main.bucket == "test-terraform-backend"
    error_message = "Bucket name should match the input variable"
  }
}

run "enables_versioning" {
  command = plan

  assert {
    condition     = aws_s3_bucket_versioning.main.versioning_configuration[0].status == "Enabled"
    error_message = "Versioning should be enabled"
  }
}

run "uses_kms_encryption" {
  command = plan

  assert {
    condition     = one([for r in aws_s3_bucket_server_side_encryption_configuration.main.rule : r.apply_server_side_encryption_by_default[0].sse_algorithm]) == "aws:kms"
    error_message = "Encryption should use SSE-KMS"
  }

  assert {
    condition     = one([for r in aws_s3_bucket_server_side_encryption_configuration.main.rule : r.bucket_key_enabled]) == true
    error_message = "Bucket key should be enabled"
  }
}

run "blocks_public_access" {
  command = plan

  assert {
    condition     = aws_s3_bucket_public_access_block.main.block_public_acls == true
    error_message = "block_public_acls should be true"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.main.block_public_policy == true
    error_message = "block_public_policy should be true"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.main.ignore_public_acls == true
    error_message = "ignore_public_acls should be true"
  }

  assert {
    condition     = aws_s3_bucket_public_access_block.main.restrict_public_buckets == true
    error_message = "restrict_public_buckets should be true"
  }
}

run "enables_kms_key_rotation" {
  command = plan

  assert {
    condition     = aws_kms_key.main.enable_key_rotation == true
    error_message = "KMS key rotation should be enabled"
  }
}

run "uses_default_kms_alias" {
  command = plan

  assert {
    condition     = aws_kms_alias.main.name == "alias/s3-terraform"
    error_message = "Default KMS alias should be alias/s3-terraform"
  }
}

run "custom_kms_alias" {
  command = plan

  variables {
    kms_alias_name = "my-custom-alias"
  }

  assert {
    condition     = aws_kms_alias.main.name == "alias/my-custom-alias"
    error_message = "KMS alias should use the custom name"
  }
}

run "bucket_policy_denies_non_ssl" {
  command = plan

  assert {
    condition     = aws_s3_bucket_policy.main.bucket == "test-terraform-backend"
    error_message = "Bucket policy should be attached to the correct bucket"
  }
}
