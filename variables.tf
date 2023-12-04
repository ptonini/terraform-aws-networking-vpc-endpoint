variable "name" {}

variable "vpc_id" {}

variable "service_name" {}

variable "type" {
  default = "Interface"
}

variable "auto_accept" {
  default = true
}

variable "policy_statement" {
  default = null
}

variable "policy_api_version" {
  default = "2012-10-17"
}

variable "private_dns_enabled" {
  default = true
}

variable "security_group_ids" {
  type    = set(string)
  default = null
}

variable "subnet_ids" {
  type    = set(string)
  default = null
}

variable "route_table_ids" {
  type    = set(string)
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}