resource "aws_route53_record" "www" {
  zone_id = zoneID can be fetched from VPC Outputs
  name    = zone name can be fetched from VPC Outputs
  type    = "CNAME"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
}