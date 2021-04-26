
resource "aws_route53_zone" "main" {
  name = var.domain_name
  name_servers = var.ns_servers_list
  tags = {
    Service     = "workadventrure"
    Environment = var.environment_name
  }
}