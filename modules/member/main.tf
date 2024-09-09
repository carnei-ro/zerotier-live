resource "zerotier_member" "this" {
  member_id               = var.member_id
  network_id              = var.network_id
  allow_ethernet_bridging = var.allow_ethernet_bridging
  authorized              = var.authorized
  capabilities            = var.capabilities
  description             = var.description
  hidden                  = var.hidden
  ip_assignments          = var.ip_assignments
  ipv4_assignments        = var.ipv4_assignments
  ipv6_assignments        = var.ipv6_assignments
  name                    = var.name
  no_auto_assign_ips      = var.no_auto_assign_ips
  rfc4193                 = var.rfc4193
  sixplane                = var.sixplane
  tags                    = var.tags
}
