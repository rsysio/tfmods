variable tags {
  type        = any
  description = "Tags to set on S3 backend resources"

  default = {
    "Name" = "Terraform Remote State"
  }
}

variable "bucket_name_prefix" {
  type        = string
  description = "account alias set in IAM"
}

variable "backend_region" {
  type        = string
  description = "region for the remote state"
  default     = "us-east-1"
}

variable "dynamodb_table_name" {
  type        = string
  description = "http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html"
  default     = "terraform_statelock"
}

variable "dynamodb_read_capacity" {
  description = "Dynamodb throughput capacity for reads"
  default     = 1
}

variable "dynamodb_write_capacity" {
  description = "Dynamodb throughput capacity for writes"
  default     = 1
}
