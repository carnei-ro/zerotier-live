
output "id" {
  description = "The ID of this resource."
  value       = zerotier_identity.this.id
}

output "private_key" {
  description = "The private key of the identity."
  value       = zerotier_identity.this.private_key
  sensitive   = true
}

output "public_key" {
  description = "The public key of the identity."
  value       = zerotier_identity.this.public_key
}
