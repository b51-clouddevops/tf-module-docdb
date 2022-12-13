# # Creates DocDB Cluster
# resource "aws_docdb_cluster" "docdb" {
#   cluster_identifier      = "roboshop-${var.ENV}"
#   engine                  = "docdb"
#   master_username         = "admin1"
#   master_password         = "roboshop1"
#   skip_final_snapshot     = false                     # Make it false in lab only
# }

# Creates a subnet group , where our cluster will be hosted on
resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-docdb-${var.ENV}"
  subnet_ids = []

  tags = {
    Name = "My docdb subnet group"
  }
}