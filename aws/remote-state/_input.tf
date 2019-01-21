variable tags {
  type        = "map"
  description = "Tags to set on S3 backend resources"

  default = {
    "Name" = "Terraform State"
  }
}

variable "account_name" {
  type        = "string"
  description = "account alias set in IAM"
}

variable "backend_region" {
  type        = "string"
  description = "region for the remote state"
  default     = "us-east-1"
}

variable "dynamodb_table_name" {
  type        = "string"
  description = "http://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.NamingRulesDataTypes.html"
  default     = "terraform_statelock"
}

variable "dynamodb_read_capacity" {
  description = "Dynamodb throughput capacity for reads"
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "Dynamodb throughput capacity for writes"
  default     = 1
}

variable "param_tfstate_dynamodb" {
  type        = "string"
  description = "Parameter store key for dynamodb table name"
  default     = "/terraform/backend/dynamodb_table"
}

variable "param_tfstate_s3_bucket" {
  type        = "string"
  description = "Parameter store key for S3 bucket name"
  default     = "/terraform/backend/bucket"
}

variable "param_tfstate_region" {
  type        = "string"
  description = "Parameter store key for backend region"
  default     = "/terraform/backend/region"
}
