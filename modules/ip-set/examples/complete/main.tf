module aws_wafv2_ip_set_test {
  source      = "../../"
  description = "IP Set Test"
  name        = "test"
  scope       = "CLOUDFRONT"
  addresses   = ["0.0.0.0/0"]
}
