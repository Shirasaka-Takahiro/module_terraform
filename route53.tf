##Route53 Zone
resource "aws_route53_zone" "primary_zone" {
  name = var.zone_name
}

##Route53 Records
resource "aws_route53_record" "naked_domain" {
  zone_id = aws_route53_zone.route53_zone.zone_id
  name    = var.zone_name
  type    = "A"
  ttl     = 300
  alias {
    name    = aws_lb.alb.dns_name
    zone_id = aws_lb.alb.zone_id
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.route53_zone.zone_id
  name    = "${var.subdomain}.${var.zone_name}"
  type    = "A"
  ttl     = 300
  alias {
    name    = aws_lb.alb.dns_name
    zone_id = aws_lb.alb.zone_id
  }
}
