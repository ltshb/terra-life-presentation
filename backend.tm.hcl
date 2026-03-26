# backend.tm.hcl
generate_hcl "_tmg_backend.tf" {
  content {
    # Terraform backend definition
    terraform {
      backend "s3" {
        bucket = "terraform-state"
        key    = "${terramate.stack.path.relative}.tfstate"

        profile = "my-aws-account"
        region  = "eu-central-1"

        encrypt      = true
        use_lockfile = true
      }
    }
  }
}


