-- Форматирование при сохранении: ruff (fix + сортировка импортов + format)
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  keys = {
    { "<leader>cf", function() require("conform").format({ async = true }) end, mode = { "n", "v" }, desc = "Format" },
    {
      "<leader>tf",
      function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        vim.notify("Autoformat " .. (vim.g.disable_autoformat and "off" or "on"))
      end,
      desc = "Toggle format on save",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_fix", "ruff_organize_imports", "ruff_format" },
      lua = { "stylua", lsp_format = "fallback" },
    },
    format_on_save = function()
      if vim.g.disable_autoformat then return end
      return { timeout_ms = 1000, lsp_format = "fallback" }
    end,
  },
}
