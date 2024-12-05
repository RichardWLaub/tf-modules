# Use aws_caller_identity to dynamically retrieve the account ID
data "aws_caller_identity" "current" {}

resource "aws_s3_account_public_access_block" "account_level" {
  account_id = data.aws_caller_identity.current.account_id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name
}

# Disable Block Public Access settings to allow public access
resource "aws_s3_bucket_public_access_block" "app_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.app_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Allow public access to objects in the bucket via bucket policy
resource "aws_s3_bucket_policy" "app_bucket_policy" {
  bucket = aws_s3_bucket.app_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = ["s3:GetObject"],
        Resource  = "${aws_s3_bucket.app_bucket.arn}/*"
      }
    ]
  })
}
