terramate {
  config {
    git {
      default_remote = "origin"
      default_branch = "main"
    }
    generate {
      hcl_magic_header_comment_style = "#"
    }
    experiments = [
      "scripts", # Enable Terramate Scripts
    ]
  }
}
