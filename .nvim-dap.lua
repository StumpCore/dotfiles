local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap", -- adjust as needed
  name = "lldb",
}

dap.configurations.rust = {
  {
    name = "dotfiles",
    type = "lldb",
    request = "launch",
    program = function()
            return vim.fn.getcwd() .. "/target/debug/dotfiles"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}
