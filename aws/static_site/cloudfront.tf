resource "aws_cloudfront_distribution" "site" {

  origin {
    domain_name = aws_s3_bucket.site.bucket_regional_domain_name
    origin_id   = var.origin_access_id

    s3_origin_config {
      origin_access_identity = "origin-access-identity/cloudfront/${var.origin_access_id}"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Static site"
  default_root_object = "index.html"

  aliases = concat([var.fqdn], var.aliases)

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.origin_access_id
    compress         = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = local.tags

  viewer_certificate {
    acm_certificate_arn      = aws_acm_certificate.cert.arn
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }
}
