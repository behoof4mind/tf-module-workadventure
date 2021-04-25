
resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = {
    Service     = "workadventrure"
    Environment = var.environment_name
  }
}