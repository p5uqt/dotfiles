-- отключаем netrw (используем oil)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- базовая совместимость
vim.opt.compatible = false
 
-- внешний вид
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.cmd.colorscheme("catppuccin")

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

