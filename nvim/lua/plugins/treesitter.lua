return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({})
      require("nvim-treesitter.install").prefer_git = true

      local parsers = {
        "bash", "c", "cpp", "lua", "python",
        "json", "yaml", "toml", "markdown",
        "vim", "vimdoc",
      }

      local installed = require("nvim-treesitter.config").get_installed("parsers")
      for _, lang in ipairs(parsers) do
        if not vim.tbl_contains(installed, lang) then
          vim.cmd("TSInstall " .. lang)
        end
      end
    end,
  },
}
