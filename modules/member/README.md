# Module ZeroTier Member

Manage ZeroTier members and join them to networks

Ref: https://registry.terraform.io/providers/zerotier/zerotier/latest/docs/resources/member

<!-- BEGINNING OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_zerotier"></a> [zerotier](#provider\_zerotier) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [zerotier_member.this](https://registry.terraform.io/providers/hashicorp/zerotier/latest/docs/resources/member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_member_id"></a> [member\_id](#input\_member\_id) | (String) The identity ID of this member. | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | (String) ID of the network this member belongs to. | `string` | n/a | yes |
| <a name="input_allow_ethernet_bridging"></a> [allow\_ethernet\_bridging](#input\_allow\_ethernet\_bridging) | (Boolean) Is this member allowed to activate ethernet bridging over the ZeroTier network? Default is false. | `bool` | `false` | no |
| <a name="input_authorized"></a> [authorized](#input\_authorized) | (Boolean) Is the member authorized on the network? Default is true. | `bool` | `true` | no |
| <a name="input_capabilities"></a> [capabilities](#input\_capabilities) | (Set of Number) List of network capabilities | `set(number)` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | (String) Text description of this member. | `string` | `""` | no |
| <a name="input_hidden"></a> [hidden](#input\_hidden) | (Boolean) Is this member visible? Default is false. | `bool` | `false` | no |
| <a name="input_ip_assignments"></a> [ip\_assignments](#input\_ip\_assignments) | (Set of String) List of IP address assignments | `set(string)` | `null` | no |
| <a name="input_ipv4_assignments"></a> [ipv4\_assignments](#input\_ipv4\_assignments) | (Set of String) ZeroTier managed IPv4 addresses. | `set(string)` | `null` | no |
| <a name="input_ipv6_assignments"></a> [ipv6\_assignments](#input\_ipv6\_assignments) | (Set of String) ZeroTier managed IPv6 addresses. | `set(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | (String) Descriptive name of this member. | `string` | `null` | no |
| <a name="input_no_auto_assign_ips"></a> [no\_auto\_assign\_ips](#input\_no\_auto\_assign\_ips) | (Boolean) Exempt this member from the IP auto assignment pool on a Network. Default is false. | `bool` | `false` | no |
| <a name="input_rfc4193"></a> [rfc4193](#input\_rfc4193) | (String) Computed RFC4193 address. assign\_ipv6.rfc4193 must be enabled on the network resource. | `string` | `null` | no |
| <a name="input_sixplane"></a> [sixplane](#input\_sixplane) | (String) Computed 6PLANE address. assign\_ipv6.sixplane must be enabled on the network resource. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Set of List of Number) List of network tags | `set(list(number))` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource. |
| <a name="output_name"></a> [name](#output\_name) | Descriptive name of this member. |
| <a name="output_resource"></a> [resource](#output\_resource) | The ZeroTier member resource. |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
