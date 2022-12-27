locals {
  DOCDB_USERNAME = jsondecode(data.aws_secretsmanager_secret_version.robot-secrets.secret_string)["DOCDB_USERNAME"]
  DOCDB_PASSWORD = jsondecode(data.aws_secretsmanager_secret_version.robot-secrets.secret_string)["DOCDB_PASSWORD"]
}