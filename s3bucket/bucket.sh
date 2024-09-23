resource "aws_s3_bucket" "example" {
  bucket = "my-aws_bucket_praveen-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
