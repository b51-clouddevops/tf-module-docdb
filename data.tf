data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "b51-tf-remote-state-bucket"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}


# Fecthing the information of the existing secret which has multiple values
data "aws_secretsmanager_secret" "secrets" {
  name = "robot/secrets"
}

# Fecthing the ID of the secret
data "aws_secretsmanager_secret_version" "secrets" {
  secret_id = data.aws_secretsmanager_secret.secrets.id
}

output "data" {
  value = jsondecode(aws_secretsmanager_secret_version.secrets.secret_string)["key1"]
}

# output "data" {
#   value = data.aws_secretsmanager_secret_version.secrets
# }