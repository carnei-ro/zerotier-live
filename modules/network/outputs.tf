output "id" {
  description = "ZeroTier's internal network identifier, aka NetworkID"
  value       = zerotier_network.this.id
}

output "name" {
  description = "ZeroTier's network name"
  value       = zerotier_network.this.name
}

output "resource" {
  description = "The ZeroTier network resource"
  value       = zerotier_network.this
}
