variable "member_id" {
  description = "(String) The identity ID of this member."
  type        = string
}

variable "network_id" {
  description = "(String) ID of the network this member belongs to."
  type        = string
}

variable "allow_ethernet_bridging" {
  description = "(Boolean) Is this member allowed to activate ethernet bridging over the ZeroTier network? Default is true."
  type        = bool
  default     = true
}

variable "authorized" {
  description = "(Boolean) Is the member authorized on the network? Default is true."
  type        = bool
  default     = true
}

variable "capabilities" {
  description = "(Set of Number) List of network capabilities"
  type        = set(number)
  default     = null
}

variable "description" {
  description = "(String) Text description of this member."
  type        = string
  default     = ""
}

variable "hidden" {
  description = "(Boolean) Is this member visible? Default is false."
  type        = bool
  default     = false
}

variable "ip_assignments" {
  description = "(Set of String) List of IP address assignments"
  type        = set(string)
  default     = null
}

variable "ipv4_assignments" {
  description = "(Set of String) ZeroTier managed IPv4 addresses."
  type        = set(string)
  default     = null
}

variable "ipv6_assignments" {
  description = "(Set of String) ZeroTier managed IPv6 addresses."
  type        = set(string)
  default     = null
}

variable "name" {
  description = "(String) Descriptive name of this member."
  type        = string
  default     = null
}

variable "no_auto_assign_ips" {
  description = "(Boolean) Exempt this member from the IP auto assignment pool on a Network. Default is false."
  type        = bool
  default     = false
}

variable "rfc4193" {
  description = "(String) Computed RFC4193 address. assign_ipv6.rfc4193 must be enabled on the network resource."
  type        = string
  default     = null
}

variable "sixplane" {
  description = "(String) Computed 6PLANE address. assign_ipv6.sixplane must be enabled on the network resource."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Set of List of Number) List of network tags"
  type        = set(list(number))
  default     = null
}
