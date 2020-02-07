variable "origin_access_id" {
  description = "CloudFront Origin Access Identity"
  type = string
}

variable "domain_name" {
  description = "www.example.com"
}

variable "zone_id" {
  description = "Route53 zone ID in which the CNAME will be created to point to CF"
}

variable "default_tags" {
  type        = map(string)
  description = "set of common tags for all resources"
}
