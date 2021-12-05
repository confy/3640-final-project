resource "aws_s3_bucket" "ss-final-image-bucket" {
  bucket        = "ss-final-image-bucket"
  force_destroy = true
}
