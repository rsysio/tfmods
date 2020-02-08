locals {

  tags = merge(var.default_tags, {
    "tfmod" = "github.com/rsysio/tfmods/aws/static_site"
  })
}

