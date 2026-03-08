variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "S3 bucket used for Terraform remote state"
  type        = string
  default     = "app-prod-ap-south-1"
}

variable "dynamodb_table_name" {
  description = "DynamoDB table used for Terraform state locking"
  type        = string
  default     = "terraform-lock-table"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "prod"
}