-- Options/Set
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.opt.confirm = true
vim.opt.number = true         -- enable line numbers
vim.opt.relativenumber = true -- enable relative line numbers
vim.opt.tabstop = 4           -- how many spaces tab inserts
vim.opt.softtabstop = 4       -- how many spaces tab inserts
vim.opt.shiftwidth = 4        -- controls number of spaces when using >> or << commands
vim.opt.expandtab = true      -- use appropriate number of spaces with tab
vim.opt.smartindent = true    -- indenting correctly after {
vim.opt.autoindent = true     -- copy indent from current line when starting new line
vim.opt.cursorline = true     -- enable cursor line
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 15                           -- always keep 15 lines above/below cursor unless at start/end of file
vim.opt.winborder = "rounded"
vim.diagnostic.config({ virtual_text = true }) -- inline diagnostics

vim.cmd.packadd("tokyonight.nvim")
vim.cmd.colorscheme("tokyonight")
