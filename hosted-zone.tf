
resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = {
    Service     = "workadventrure"
    Environment = var.environment_name
  }
}

resource "aws_route53_record" "main-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "NS"
  ttl     = "3600"
  records = var.ns_servers_list
}