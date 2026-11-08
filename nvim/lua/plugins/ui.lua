return {
  -- Статусная строка
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "catppuccin-mocha",
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_x = {
          {
            function()
              local venv = os.getenv("VIRTUAL_ENV")
              return venv and (" " .. vim.fn.fnamemodify(venv, ":t")) or ""
            end,
          },
          "filetype",
        },
      },
    },
  },

  -- Git-метки на полях
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buf)
        local gs = require("gitsigns")
        local map = function(l, r, desc) vim.keymap.set("n", l, r, { buffer = buf, desc = desc }) end
        map("]h", function() gs.nav_hunk("next") end, "Next hunk")
        map("[h", function() gs.nav_hunk("prev") end, "Prev hunk")
        map("<leader>hp", gs.preview_hunk, "Preview hunk")
        map("<leader>hr", gs.reset_hunk, "Reset hunk")
        map("<leader>hb", gs.blame_line, "Blame line")
      end,
    },
  },

  -- Подсказка по сочетаниям клавиш
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>d", group = "debug" },
        { "<leader>h", group = "git hunk" },
        { "<leader>p", group = "python" },
        { "<leader>t", group = "toggle" },
        { "<leader>c", group = "code" },
      },
    },
  },

  -- Направляющие отступов
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = { indent = { char = "│" }, scope = { enabled = true } } },

  -- Автозакрытие скобок (+ интеграция с cmp)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({ check_ts = true })
      local ok, cmp = pcall(require, "cmp")
      if ok then
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
      end
    end,
  },

  -- surround (ys/cs/ds), текстовые объекты и т.п.
  { "echasnovski/mini.surround", version = false, opts = {} },
  { "echasnovski/mini.ai", version = false, opts = {} },

  -- TODO/FIXME подсветка
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },
}
