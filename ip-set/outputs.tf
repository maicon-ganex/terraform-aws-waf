output ipset_id {
  value       = aws_wafv2_ip_set.this.id
  description = "A unique identifier for the set."
}

output ipset_arn {
  value       = aws_wafv2_ip_set.this.arn
  description = "The Amazon Resource Name (ARN) that identifies the cluster."
}
