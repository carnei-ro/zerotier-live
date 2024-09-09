# ------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# ------------------------------------------------------------------------------

# Version constraints
terraform_binary              = "tofu"
terraform_version_constraint  = ">= 1.6.0"
terragrunt_version_constraint = ">= 0.54.18"

# Local aliases for improved maintainability
locals {
  gitlab_username   = "carnei-ro"
  gitlab_project_id = "53959949"
  gitlab_password   = get_env("GITLAB_TOKEN")

  iac_repo  = "zerotier-live"
  iac_path  = path_relative_to_include()
  repo_root = get_repo_root()

  tf_state_name = sha256(format("%s/%s", local.iac_repo, local.iac_path))
}

# Copy the first .tool-versions file found in the directory hierarchy when blueprint has none,
# otherwise skip and use one defined in blueprint.
# NOTE: requires ASDF-VM (https://asdf-vm.com)
generate "tool_versions" {
  path      = ".tool-versions"
  if_exists = "skip"
  contents  = file(find_in_parent_folders(".tool-versions"))
}

# Generate the zerotier provider config
generate "zerotier_provider" {
  path      = "_tg-zerotier-provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    data "gitlab_project_variable" "zerotier_token" {
      project = "${local.gitlab_project_id}"
      key     = format("ZEROTIER_CENTRAL_ACCESS_TOKEN")
    }

    terraform {
      required_providers {
        zerotier = {
          source = "zerotier/zerotier"
          version = "~> 1.6.0"
        }
      }
    }

    provider "zerotier" {
      # alias = "this"

      zerotier_central_token = data.gitlab_project_variable.zerotier_token.value
    }
  EOF
}

# Generate the Backend config
generate "backend" {
  path      = "_backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "http" {
        address        = "${format("https://gitlab.com/api/v4/projects/%s/terraform/state/%s", local.gitlab_project_id, local.tf_state_name)}"
        lock_address   = "${format("https://gitlab.com/api/v4/projects/%s/terraform/state/%s/lock", local.gitlab_project_id, local.tf_state_name)}"
        unlock_address = "${format("https://gitlab.com/api/v4/projects/%s/terraform/state/%s/lock", local.gitlab_project_id, local.tf_state_name)}"
        username       = "${local.gitlab_username}"
        password       = "${local.gitlab_password}"
        lock_method    = "POST"
        unlock_method  = "DELETE"
        retry_wait_min = "5"
      }
    }
  EOF
}

# ------------------------------------------------------------------------------
# AUTO RETRY
# The following errors are well known and should be retried.
# See https://terragrunt.gruntwork.io/docs/features/auto-retry/
# ------------------------------------------------------------------------------

retry_max_attempts       = 3
retry_sleep_interval_sec = 5

retryable_errors = [
  # Intermittent network issues
  "(?s).*Error installing provider.*tcp.*connection reset by peer.*",
  "(?s).*read:.*software caused connection abort.*",
  "(?s).*ssh_exchange_identification.*Connection closed by remote host.*",
]

# ------------------------------------------------------------------------------
# GLOBAL PARAMETERS
# These variables apply to all configurations in this subfolder. These are automatically merged into the child
# `terragrunt.hcl` config via the include block.
# ------------------------------------------------------------------------------

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = merge(
  {
    default_labels = merge(
      {
        created_by    = "terragrunt"
        iac_repo      = local.iac_repo
        iac_path      = replace(format("ends-with...%s", substr(local.iac_path, -49, -1)), "/", ".")
        tf_state_name = format("starts-with...%s", substr(local.tf_state_name, 0, 49))
      }
    )
  }
)
