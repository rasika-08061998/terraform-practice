resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "app-prod-ap-south-1"
  tags = {
    Name        = "app-prod-ap-south-1"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST" # Or PROVISIONED
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "terraform-lock-table"
    Environment = "Production"
  }
}



