# Loads the schema
resource "null_resource" "mongodb-schema" { 
  
  # This ensures that schema will load only after the creation of DocumentDb
  depends_on = [aws_docdb_cluster.docdb]

  provisioner "local-exec" {
command = <<EOF
  cd /tmp/
  curl -s -L -o /tmp/mongodb.zip "https://github.com/stans-robot-project/mongodb/archive/main.zip"
  wget https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
  unzip -o mongodb.zip 
  cd mongodb-main 
  sleep 240
  mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < catalogue.js
  mongo --ssl --host ${aws_docdb_cluster.docdb.endpoint}:27017 --sslCAFile /tmp/rds-combined-ca-bundle.pem --username admin1 --password roboshop1 < users.js
EOF   
  }
}