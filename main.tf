# --------------------------------------
# AWS Backend configuration
# --------------------------------------
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      region = "us-east-1"
    }
  }
  backend "s3" {
    bucket = "691e4876-f921-0542-c9c7-0989c184fe8c-backend"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# --------------------------------------
# AWS Provider
# --------------------------------------
provider "aws" {
  region = "us-east-1"
}

# --------------------------------------
# S3
# --------------------------------------
resource "aws_s3_bucket" "thebeatles-lyrics-bucket" {
  bucket = "thebeatles-lyrics-bucket"
  acl    = "private"

  tags = {
    Name        = "lyrics-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "thebeatles-lyrics-bucket-encrypted" {
  bucket = "thebeatles-lyrics-bucket-encrypted"
  acl    = "private"

  tags = {
    Name        = "lyrics-bucket"
    Environment = "Dev"
  }
}

resource "aws_lambda_permission" "allow_bucket1" {
  statement_id  = "AllowExecutionFromS3Bucket1"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.move-to-encrypted.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.thebeatles-lyrics-bucket.arn
  depends_on = [ 
    aws_lambda_permission.allow_bucket1
  ]
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.thebeatles-lyrics-bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.move-to-encrypted.arn
    events              = ["s3:ObjectCreated:Put"]
  }

  depends_on = [
    aws_lambda_function.move-to-encrypted
    ]
}

# --------------------------------------
# Lambda
# --------------------------------------
resource "aws_iam_policy" "lambda-s3-policy" {
  name        = "AWSLambdaS3Policy"
  path        = "/"
  description = "A policy to allow Lambda access to S3 bucket."

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:PutLogEvents",
                "logs:CreateLogGroup",
                "logs:CreateLogStream"
            ],
            "Resource": "arn:aws:logs:*:*:*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::${aws_s3_bucket.thebeatles-lyrics-bucket.bucket}/*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::${aws_s3_bucket.thebeatles-lyrics-bucket-encrypted.bucket}/*"
        }
    ]
}
EOF
}

resource "aws_iam_role" "lambda-execution-role" {
  name = "lambda-s3-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "lambda-execution-role-pattachment" {
  role       = aws_iam_role.lambda-execution-role.name
  policy_arn = aws_iam_policy.lambda-s3-policy.arn
}

resource "aws_lambda_function" "move-to-encrypted" {
   
   function_name = "move_to_encrypted"
   s3_bucket = "lambda-repository-dcbg"
   s3_key    = "v1.0.0/lambda_processing.zip"

   handler = "lambda_function.lambda_handler"
   runtime = "ruby2.7"

   role = aws_iam_role.lambda-execution-role.arn
}
