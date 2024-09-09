terraform {
  source = "${get_repo_root()}//modules/member"
}

include {
  path = find_in_parent_folders()
}

dependency "member" {
  config_path = "${get_repo_root()}/zerotier_central/identity/openwrt-escritorio-leandro/"
}

dependency "network" {
  config_path = "${get_repo_root()}/zerotier_central/network/cameras/"
}

inputs = {
  name       = "OpenWRT escritorio-leandro"
  member_id  = dependency.member.outputs.id
  network_id = dependency.network.outputs.id

  ip_assignments = ["192.168.168.10"]
}
