resource "aws_route53_zone" "racistzebra" {
  name = var.domain_name
}

resource "aws_route53_record" "subdomain" {
  zone_id = aws_route53_zone.racistzebra.zone_id
  name    = var.subdomain_name
  type    = "CNAME"
  records = [var.alb_hostname]
  ttl = 300
}