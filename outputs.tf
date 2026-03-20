output "bucket" {
  value       = aws_s3_bucket.main
  description = "Created aws_s3_bucket."
}

output "bucket_arn" {
  value       = aws_s3_bucket.main.arn
  description = "ARN of the S3 bucket"
}

output "bucket_id" {
  value       = aws_s3_bucket.main.id
  description = "ID of the S3 bucket (bucket name)"
}

output "kms_key" {
  value       = aws_kms_key.main
  description = "Created aws_kms_key to encrypt the bucket."
}

output "kms_key_arn" {
  value       = aws_kms_key.main.arn
  description = "ARN of the KMS key"
}
