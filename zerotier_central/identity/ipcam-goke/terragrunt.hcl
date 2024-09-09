terraform {
  source = "${get_repo_root()}//modules/identity"
}

include {
  path = find_in_parent_folders()
}
