stack {
  id   = "34cc5570-2c29-11f1-a903-d30e8154dbc0"
  name = "Module using remote state"

  tags = [
    "generate-remote-states",
  ]
}

globals {
  remote_states = [{
    stack_path = "../module-used-as-remote-state"
  }]
}
