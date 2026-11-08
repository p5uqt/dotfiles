-- отключаем netrw (используем oil)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- базовая совместимость
vim.opt.compatible = false
 
-- внешний вид
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- colorscheme задаётся в lua/plugins/catpuccin.lua

-- поведение мыши и буфера обмена
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- поиск
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- отступы
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- синтаксис и файл-типы
vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

vim.keymap.set("i", "jj", "<Esc>")



-- удобства
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- подсветка скопированного
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.hl.on_yank({ timeout = 200 }) end,
})

-- Python: линия на 88 символах, запуск файла и pytest во встроенном терминале
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(ev)
    vim.opt_local.colorcolumn = "89"
    local run = function(cmd)
      return function()
        vim.cmd("write")
        vim.cmd("botright 15split | terminal " .. cmd .. " " .. vim.fn.shellescape(vim.fn.expand("%")))
      end
    end
    vim.keymap.set("n", "<leader>pr", run("python3"), { buffer = ev.buf, desc = "Run file" })
    vim.keymap.set("n", "<leader>pt", run("python3 -m pytest -q"), { buffer = ev.buf, desc = "Pytest file" })
    vim.keymap.set("n", "<leader>pb", "obreakpoint()<Esc>", { buffer = ev.buf, desc = "Insert breakpoint()" })
  end,
})
