return {
  -- Выбор виртуального окружения (.venv, poetry, conda, pyenv…) — pyright подхватит его
  {
    "linux-cultist/venv-selector.nvim",
    ft = "python",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    opts = { options = { notify_user_on_venv_activation = true } },
    keys = { { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Select venv" } },
  },

  -- Отладчик: debugpy + UI
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
    },
    keys = {
      { "<F5>", function() require("dap").continue() end, desc = "Debug: continue" },
      { "<F10>", function() require("dap").step_over() end, desc = "Debug: step over" },
      { "<F11>", function() require("dap").step_into() end, desc = "Debug: step into" },
      { "<F12>", function() require("dap").step_out() end, desc = "Debug: step out" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end, desc = "Conditional breakpoint" },
      { "<leader>du", function() require("dapui").toggle() end, desc = "Debug UI" },
      { "<leader>dt", function() require("dap-python").test_method() end, desc = "Debug test method" },
      { "<leader>dq", function() require("dap").terminate() end, desc = "Debug: stop" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      require("nvim-dap-virtual-text").setup({})
      -- debugpy ставится через mason (см. ensure_installed ниже)
      require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
      require("dap-python").test_runner = "pytest"

      dap.listeners.after.event_initialized.dapui = dapui.open
      dap.listeners.before.event_terminated.dapui = dapui.close
      dap.listeners.before.event_exited.dapui = dapui.close

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticOk", linehl = "Visual" })
    end,
  },

  -- Ставит debugpy и stylua вместе с LSP-серверами
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = { ensure_installed = { "debugpy", "stylua" } },
  },
}
