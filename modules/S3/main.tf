resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project}-${var.s3_bucket}-${var.environment}"
  acl    = var.s3_acl_bucket

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "S3GetObjectForCloudFront",
      "Effect": "Allow",
      "Principal": {
        "CanonicalUser": "${var.cf_canonical_user_id}"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.project}-${var.s3_bucket}-${var.environment}/*"
    }
  ]
}
POLICY

  versioning {
    enabled = true
  }

  lifecycle_rule {
    prefix  = "config/"
    enabled = true

    expiration {
      days = var.expiration_days
    }
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT","POST"]
    allowed_origins = ["*"]
    expose_headers = ["ETag"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.s3_sse_algorithm
      }
    }
  }

  tags = merge(var.common_tags, map(
    "Name", "${var.project}-${var.s3_bucket}-${var.environment}"
  ))
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_policy" {
  bucket                  = aws_s3_bucket.s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}