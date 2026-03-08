terraform {
  backend "s3" {
    bucket         = "app-prod-ap-south-1"
    key            = "prod/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table" # <--- Enables locking
  }
}

