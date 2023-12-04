resource "aws_vpc_endpoint" "this" {
  vpc_id              = var.vpc_id
  service_name        = var.service_name
  vpc_endpoint_type   = var.type
  auto_accept         = var.auto_accept
  private_dns_enabled = var.type == "Interface" ? var.private_dns_enabled : null
  security_group_ids  = var.type == "Interface" ? var.security_group_ids : null
  subnet_ids          = var.type == "Interface" ? var.subnet_ids : null
  route_table_ids     = var.type == "Gateway" ? var.route_table_ids : null
  policy = var.policy_statement == null ? null : jsonencode({
    Version   = var.policy_api_version
    Statement = var.policy_statement
  })
  tags = merge({ Name = var.name }, var.tags)
  lifecycle {
    ignore_changes = [
      tags["business_unit"],
      tags["product"],
      tags["env"],
      tags_all
    ]
  }
}