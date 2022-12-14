# Loads the schema
resource "null_resource" "mongodb-schema" { 
  
  # This ensures that schema will load only after the creation of DocumentDb
  depends_on = [aws_docdb_cluster.docdb, aws_docdb_cluster_instance.cluster_instances]

  provisioner "local-exec" {
command = <<EOF
  cd /tmp/
  curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
  wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
  unzip -o mongodb.zip 
  cd mongodb-main 
  mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username ${local.DOCDB_USERNAME} --password ${local.DOCDB_PASSWORD} < catalogue.js
  mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username ${local.DOCDB_USERNAME} --password ${local.DOCDB_PASSWORD} < users.js
EOF   
  }
}
