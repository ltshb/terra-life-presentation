# TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket       = "terraform-state"
    encrypt      = true
    key          = "my-module-2.tfstate"
    profile      = "my-aws-account"
    region       = "eu-central-1"
    use_lockfile = true
  }
}
