# TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "module_used_as_remote_state" {
  backend = "s3"
  config = {
    bucket  = "swisstopo-playground-brice-schaffner-tenant-terraform-state"
    key     = "module-used-as-remote-state.tfstate"
    profile = "swisstopo-playground-brice-schaffner"
    region  = "eu-central-1"
  }
}
