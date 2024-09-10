terraform {
  source = "${get_repo_root()}//modules/network"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  name        = "cameras"
  description = "Network for remote cameras"

  assignment_pool = [
    {
      start = "192.168.168.10"
      end   = "192.168.168.19"
    }
  ]

  route = [
    {
      target = "192.168.168.0/24"
    }
  ]

  assign_ipv4 = [
    {
      zerotier = true
    }
  ]
}
