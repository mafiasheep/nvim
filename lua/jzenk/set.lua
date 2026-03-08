vim.g.mapleader = " " -- space leader key
vim.o.number = true -- enable line numbers
vim.o.relativenumber = true -- enable relative line numbers
vim.o.tabstop = 4 -- how many spaces tab inserts
vim.o.softtabstop = 4 -- how many spaces tab inserts
vim.o.shiftwidth = 4 -- controls number of spaces when using >> or << commands
vim.o.expandtab = true -- use appropriate number of spaces with tab
vim.o.smartindent = true -- indenting correctly after {
vim.o.autoindent = true -- copy indent from current line when starting new line
vim.o.cursorline = true -- enable cursor line
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.updatetime = 50
vim.o.colorcolumn = "80"
vim.o.scrolloff = 15 -- always keep 15 lines above/below cursor unless at start/end of file
vim.diagnostic.config({ virtual_text = true }) -- inline diagnostics

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

