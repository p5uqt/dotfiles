-- LSP: basedpyright (типы, автодополнение, переходы) + ruff (линтер, quick-fix)
-- Серверы ставятся автоматически через mason.
return {
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            -- ruff сам сортирует импорты
            disableOrganizeImports = true,
            analysis = {
              typeCheckingMode = "standard",
              autoImportCompletions = true,
              diagnosticMode = "openFilesOnly",
              inlayHints = { variableTypes = false, callArgumentNames = false },
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })

      -- ensure_installed + automatic_enable включают серверы через vim.lsp.enable
      require("mason-lspconfig").setup({
        ensure_installed = { "basedpyright", "ruff", "lua_ls" },
      })

      vim.diagnostic.config({
        virtual_text = { prefix = "●", spacing = 2 },
        severity_sort = true,
        float = { border = "rounded", source = true },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.INFO] = "●",
            [vim.diagnostic.severity.HINT] = "➤",
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          -- hover показывает pyright, а не ruff
          if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end

          local map = function(keys, fn, desc)
            vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
          end
          local tb = require("telescope.builtin")
          map("gd", tb.lsp_definitions, "Go to definition")
          map("gr", tb.lsp_references, "References")
          map("gI", tb.lsp_implementations, "Implementations")
          map("gy", tb.lsp_type_definitions, "Type definition")
          map("K", function() vim.lsp.buf.hover({ border = "rounded" }) end, "Hover docs")
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("<leader>ds", tb.lsp_document_symbols, "Document symbols")
          map("<leader>ws", tb.lsp_dynamic_workspace_symbols, "Workspace symbols")
          map("<leader>xd", tb.diagnostics, "Diagnostics list")
          map("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
          end, "Toggle inlay hints")
        end,
      })
    end,
  },
}
