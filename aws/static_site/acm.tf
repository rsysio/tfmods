resource "aws_acm_certificate" "cert" {

  domain_name               = var.fqdn
  subject_alternative_names = var.aliases
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = local.tags
}

resource "aws_route53_record" "cert_validation" {
  count = length(aws_acm_certificate.cert.domain_validation_options)

  name    = aws_acm_certificate.cert.domain_validation_options[count.index].resource_record_name
  type    = aws_acm_certificate.cert.domain_validation_options[count.index].resource_record_type
  zone_id = var.zone_id
  records = [aws_acm_certificate.cert.domain_validation_options[count.index].resource_record_value]
  ttl     = 60
}
