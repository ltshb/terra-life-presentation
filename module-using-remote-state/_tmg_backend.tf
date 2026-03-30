# TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket       = "swisstopo-playground-brice-schaffner-tenant-terraform-state"
    encrypt      = true
    key          = "module-using-remote-state.tfstate"
    profile      = "swisstopo-playground-brice-schaffner"
    region       = "eu-central-1"
    use_lockfile = true
  }
}
