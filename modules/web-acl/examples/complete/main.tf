module "waf_web_acl_test" {
  source = "../../"
  name   = "web-acl-test"
  scope  = "CLOUDFRONT"
  ip_sets_rule = [
    {
      name       = "ip-set-rule"
      priority   = 0
      ip_set_arn = module.aws_wafv2_ip_set_test.ipset_arn
      action     = "count"
    }
  ]

  managed_rules = [
    {
      name            = "AWSManagedRulesLinuxRuleSet",
      priority        = 50
      override_action = "none"
      rule_action_override  = []
    },
    {
      name            = "AWSManagedRulesAmazonIpReputationList",
      priority        = 2
      override_action = "count"
      rule_action_override  = []
    },
    {
      name            = "AWSManagedRulesBotControlRuleSet",
      priority        = 1
      override_action = "count"
      rule_action_override  = []
    },
  ]
}

module aws_wafv2_ip_set_test {
  source      = "../../../ip-set/"
  description = "IP Set Test"
  name        = "test"
  scope       = "CLOUDFRONT"
  addresses   = ["0.0.0.0/0"]
}
