# Module ZeroTier Network

Network provider for ZeroTier, allows you to create ZeroTier networks.

Ref: https://registry.terraform.io/providers/zerotier/zerotier/latest/docs/resources/network

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
| [zerotier_network.this](https://registry.terraform.io/providers/hashicorp/zerotier/latest/docs/resources/network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the network | `string` | n/a | yes |
| <a name="input_assign_ipv4"></a> [assign\_ipv4](#input\_assign\_ipv4) | Set of object containing IPv4 Assignment RuleSets"<br><br>`zerotier` - (Boolean) Use zerotier ipv4 addressing | <pre>set(object({<br>    zerotier = bool<br>  }))</pre> | `[]` | no |
| <a name="input_assign_ipv6"></a> [assign\_ipv6](#input\_assign\_ipv6) | Set of object containing IPv6 Assignment RuleSets"<br><br>`rfc4193`  - (Boolean) RFC4193 addressing method<br>`sixplane` - (Boolean) 6PLANE addressing method<br>`zerotier` - (Boolean) Use zerotier ipv6 manual addressing | <pre>set(object({<br>    rfc4193  = optional(bool, null)<br>    sixplane = optional(bool, null)<br>    zerotier = optional(bool, null)<br>  }))</pre> | `[]` | no |
| <a name="input_assignment_pool"></a> [assignment\_pool](#input\_assignment\_pool) | Set of object containing the Assignment Pools"<br><br>`end`   - (String) The last address in the assignment rule. This must be the highest number in the pool. `end` must also be accompanied by `start`.<br>`start` - (String) The first address in the assignment rule. This must be the lowest number in the pool. `start` must also be accompanied by `end`. | <pre>set(object({<br>    end   = string<br>    start = string<br>  }))</pre> | `[]` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the network | `string` | `null` | no |
| <a name="input_dns"></a> [dns](#input\_dns) | Set of object containing DNS settings for network members"<br><br>`domain`  - (String) Domain suffix for DNS searches<br>`servers` - (List of String) Nameservers to send DNS requests to | <pre>set(object({<br>    domain  = string<br>    servers = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_enable_broadcast"></a> [enable\_broadcast](#input\_enable\_broadcast) | Enable broadcast packets on the network. Defaults to true. | `bool` | `true` | no |
| <a name="input_flow_rules"></a> [flow\_rules](#input\_flow\_rules) | The layer 2 flow rules to apply to packets traveling across this network. Please see https://www.zerotier.com/manual/#3_4_1 for more information. Defaults to `accept;`. | `string` | `"accept;"` | no |
| <a name="input_multicast_limit"></a> [multicast\_limit](#input\_multicast\_limit) | Maximum number of recipients per multicast or broadcast. Warning - Setting this to 0 will disable IPv4 communication on your network! Defaults to 32. | `number` | `32` | no |
| <a name="input_private"></a> [private](#input\_private) | Whether or not the network is private. If false, members will NOT need to be authorized to join. Defaults to true. | `bool` | `true` | no |
| <a name="input_route"></a> [route](#input\_route) | Set of object containing the Route Rules"<br><br>`target` - (String) Network to route for<br>`via` - (Optional String) Gateway address | <pre>set(object({<br>    target = string<br>    via    = optional(string, null)<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ZeroTier's internal network identifier, aka NetworkID |
| <a name="output_name"></a> [name](#output\_name) | ZeroTier's network name |
| <a name="output_resource"></a> [resource](#output\_resource) | The ZeroTier network resource |
<!-- END OF PRE-COMMIT-OPENTOFU DOCS HOOK -->
