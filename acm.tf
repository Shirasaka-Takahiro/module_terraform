##ACM
resource "aws_acm_certificate" "cert" {
  domain_name = "*.${var.zone_name}"
  subject_alternative_names = ["${var.zone_name}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

##Create cname record for valification on Route53
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  type            = each.value.type
  ttl             = "300"
  zone_id = aws_route53_zone.primary_zone.zone_id
}