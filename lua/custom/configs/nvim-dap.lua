local dap = require "dap"

dap.adapters.ruby = {
  type = "executable",
  command = "rdbg",
}
dap.configurations.ruby = {
  {
    type = "ruby",
    name = "Debug current file with rdbg",
    request = "launch",
    program = "${file}",
  },
}
dap.adapters.go = {
  type = "server",
  port = "38697",
  executable = {
    command = "dlv",
    args = { "dap", "-a", "0.0.0.0:38697" },
  },
}
dap.configurations.go = {
  {
    type = "go",
    name = "Debug",
    request = "launch",
    program = "${file}",
    showLog = true,
  },
}
