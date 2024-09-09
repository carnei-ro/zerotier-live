resource "zerotier_network" "this" {
  dynamic "assign_ipv4" {
    for_each = var.assign_ipv4
    content {
      zerotier = assign_ipv4.value.zerotier
    }
  }
  dynamic "assign_ipv6" {
    for_each = var.assign_ipv6
    content {
      rfc4193  = assign_ipv6.value.rfc4193
      sixplane = assign_ipv6.value.sixplane
      zerotier = assign_ipv6.value.zerotier
    }
  }
  dynamic "assignment_pool" {
    for_each = var.assignment_pool
    content {
      end   = assignment_pool.value.end
      start = assignment_pool.value.start
    }
  }
  description = var.description
  dynamic "dns" {
    for_each = var.dns
    content {
      domain  = dns.value.domain
      servers = dns.value.servers
    }
  }
  enable_broadcast = var.enable_broadcast
  flow_rules       = var.flow_rules
  multicast_limit  = var.multicast_limit
  name             = var.name
  private          = var.private
  dynamic "route" {
    for_each = var.route
    content {
      target = route.value.target
      via    = route.value.via
    }
  }
}
