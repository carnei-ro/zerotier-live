output "id" {
  description = "The ID of this resource."
  value       = zerotier_member.this.id
}

output "name" {
  description = "Descriptive name of this member."
  value       = zerotier_member.this.name
}

output "resource" {
  description = "The ZeroTier member resource."
  value       = zerotier_member.this
}
