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
      name            = "AWSManagedRulesCommonRuleSet",
      priority        = 1
      override_action = "none"
      rule_action_override  = [
        {
          name = "CrossSiteScripting_BODY"
          action = "count"
        },
        {
          name = "EC2MetaDataSSRF_BODY"
          action = "count"
        },
        {
          name = "SizeRestrictions_BODY"
          action = "allow"
        } 
      ]
    },
    {
      name            = "AWSManagedRulesSQLiRuleSet",
      priority        = 2
      override_action = "none"
      rule_action_override  = []
    },
    {
      name            = "AWSManagedRulesPHPRuleSet",
      priority        = 3
      override_action = "none"
      rule_action_override  = []
    },
    {
      name            = "AWSManagedRulesWordPressRuleSet",
      priority        = 4
      override_action = "none"
      rule_action_override  = []
    },
    {
      name            = "AWSManagedRulesAmazonIpReputationList",
      priority        = 5
      override_action = "none"
      rule_action_override  = []
    },
    {
      name            = "AWSManagedRulesBotControlRuleSet",
      priority        = 6
      override_action = "none"
      rule_action_override  = [
        {
          name = "CategoryHttpLibrary"
          action = "count"
        },
        {
          name = "SignalNonBrowserUserAgent"
          action = "count"
        }
      ]
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
