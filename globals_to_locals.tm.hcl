generate_hcl "_tmg_locals.tf" {
  condition = tm_alltrue([
    tm_try(tm_length(global.globals_to_locals) > 0, false),
    tm_contains(terramate.stack.tags, "generate-globals-to-locals")
  ])

  content {
    tm_dynamic "locals" {
      for_each = [1]
      # In the lookup below we don't provide a default in order to fail if the key is not found
      # this avoid bug hard to debug
      attributes = { for key in global.globals_to_locals : key => tm_lookup(global, key) }
    }
  }
}

