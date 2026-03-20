variable "bucket_name" {
  description = "Name of the s3 bucket"
  type        = string
}

variable "kms_alias_name" {
  description = "Name of the KMS key alias (the 'alias/' prefix is added automatically)"
  type        = string
  default     = "s3-terraform"
}
