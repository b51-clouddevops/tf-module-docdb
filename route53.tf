resource "aws_route53_record" "www" {
  zone_id = zoneID can be fetched from VPC Outputs
  name    = zone name can be fetched from VPC Outputs
  type    = "CNAME"
  ttl     = 10
  records = [aws_docdb_cluster.docdb.endpoint]
}