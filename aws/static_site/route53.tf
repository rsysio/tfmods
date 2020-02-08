resource "aws_route53_record" "site" {
  zone_id = var.zone_id
  name    = var.fqdn
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "aliases" {
  count = length(var.aliases)

  zone_id = var.zone_id
  name    = var.aliases[count.index]
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.site.domain_name
    zone_id                = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}
