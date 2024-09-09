variable "assign_ipv4" {
  description = <<-DESCRIPTION
  Set of object containing IPv4 Assignment RuleSets"

  `zerotier` - (Boolean) Use zerotier ipv4 addressing
  DESCRIPTION
  type = set(object({
    zerotier = bool
  }))
  default = []
}

variable "assign_ipv6" {
  description = <<-DESCRIPTION
  Set of object containing IPv6 Assignment RuleSets"

  `rfc4193`  - (Boolean) RFC4193 addressing method
  `sixplane` - (Boolean) 6PLANE addressing method
  `zerotier` - (Boolean) Use zerotier ipv6 manual addressing
  DESCRIPTION
  type = set(object({
    rfc4193  = optional(bool, null)
    sixplane = optional(bool, null)
    zerotier = optional(bool, null)
  }))
  default = []
}

variable "assignment_pool" {
  description = <<-DESCRIPTION
  Set of object containing the Assignment Pools"

  `end`   - (String) The last address in the assignment rule. This must be the highest number in the pool. `end` must also be accompanied by `start`.
  `start` - (String) The first address in the assignment rule. This must be the lowest number in the pool. `start` must also be accompanied by `end`.
  DESCRIPTION
  type = set(object({
    end   = string
    start = string
  }))
  default = []
}

variable "description" {
  description = "The description of the network"
  type        = string
  default     = null
}

variable "dns" {
  description = <<-DESCRIPTION
  Set of object containing DNS settings for network members"

  `domain`  - (String) Domain suffix for DNS searches
  `servers` - (List of String) Nameservers to send DNS requests to
  DESCRIPTION
  type = set(object({
    domain  = string
    servers = list(string)
  }))
  default = []
}

variable "enable_broadcast" {
  description = "Enable broadcast packets on the network. Defaults to true."
  type        = bool
  default     = true
}

variable "flow_rules" {
  description = "The layer 2 flow rules to apply to packets traveling across this network. Please see https://www.zerotier.com/manual/#3_4_1 for more information. Defaults to `accept;`."
  type        = string
  default     = "accept;"
}

variable "multicast_limit" {
  description = "Maximum number of recipients per multicast or broadcast. Warning - Setting this to 0 will disable IPv4 communication on your network! Defaults to 32."
  type        = number
  default     = 32
}

variable "name" {
  description = "The name of the network"
  type        = string
}

variable "private" {
  description = "Whether or not the network is private. If false, members will NOT need to be authorized to join. Defaults to true."
  type        = bool
  default     = true
}

variable "route" {
  description = <<-DESCRIPTION
  Set of object containing the Route Rules"

  `target` - (String) Network to route for
  `via` - (Optional String) Gateway address
  DESCRIPTION
  type = set(object({
    target = string
    via    = optional(string, null)
  }))
  default = []
}
