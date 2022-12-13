# # Creates DocDB Cluster
resource "aws_docdb_cluster" "docdb" {
  cluster_identifier    = "roboshop-${var.ENV}"
  engine                = "docdb"
  master_username       = "foo"
  master_password       = "barbut8chars"
  db_subnet_group_name  = aws_docdb_subnet_group.docdb.name
}



# Creates a subnet group , where our cluster will be hosted on
resource "aws_docdb_subnet_group" "docdb" {
  name       = "roboshop-docdb-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID

  tags = {
    Name = "robot-docdb-${var.ENV}"
  }
}