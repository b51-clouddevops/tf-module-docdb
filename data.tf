data "terraform_remote_state" "vpc" {
  backend = "s3"
  config {
    bucket = "my-bucket-name"
    key = "my-key-name"
    region = "my-region"
  }
}