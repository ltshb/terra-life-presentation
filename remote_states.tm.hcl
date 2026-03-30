# Generates the terraform remote data states.
# Remote states are only generated if the stack has the tag "generate-remote-states" and the global.remote_states
# is a list of objects with the following attributes:
# - stack_path: REQUIRED path to the stack where the remote state is stored
#               It can be either an absolute path starting from the project root, absolute path must start with "/"
#               or it can be a relative path from the current stack.
# - id: OPTIONAL identifier for the terraform_remote_state data resource, defaults to stack directory name
# When the remote stack doesn't exist, the backend is set to "stack not found" and the
# `terraform validate` command run by the CI will throw an error.
# This method ensure that remote states get updated when the stack path is updated.

generate_hcl "_tmg_remote_states.tf" {
  condition = tm_alltrue([
    tm_try(tm_length(global.remote_states) > 0, false),
    tm_contains(terramate.stack.tags, "generate-remote-states")
  ])

  content {
    tm_dynamic "data" {
      for_each = global.remote_states
      iterator = remote_state
      labels = [
        "terraform_remote_state",
        tm_try(remote_state.value.id, tm_replace(tm_basename(
          tm_replace(tm_abspath(remote_state.value.stack_path), terramate.root.path.fs.absolute, "")
        ), "-", "_")),
      ]

      content {
        backend = tm_ternary(
          # Check if the path exists
          tm_ternary(
            tm_startswith(remote_state.value.stack_path, "/"),
            # absolute path are checked against the stack lists
            tm_contains(terramate.stacks.list, remote_state.value.stack_path),
            # relative path are checked against the stack.tm.hcl file exists in the relative path
            tm_fileexists("${remote_state.value.stack_path}/stack.tm.hcl")
          ),
          "s3",
          "stack ${remote_state.value.stack_path} doesn't exists"
        )
        config = {
          bucket = "swisstopo-playground-brice-schaffner-tenant-terraform-state"
          # The key is constructed from the stack absolute path, so we have to transform relative to project absolute path
          key     = "${tm_trimprefix(tm_replace(tm_abspath(remote_state.value.stack_path), terramate.root.path.fs.absolute, ""), "/")}.tfstate"
          profile = "swisstopo-playground-brice-schaffner"
          region  = "eu-central-1"
        }
      }
    }
  }
}
