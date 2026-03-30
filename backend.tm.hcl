# backend.tm.hcl
generate_hcl "_tmg_backend.tf" {
  content {
    # Terraform backend definition
    terraform {
      backend "s3" {
        bucket = "swisstopo-playground-brice-schaffner-tenant-terraform-state"
        key    = "${terramate.stack.path.relative}.tfstate"

        profile = "swisstopo-playground-brice-schaffner"
        region  = "eu-central-1"

        encrypt      = true
        use_lockfile = true
      }
    }
  }
}


