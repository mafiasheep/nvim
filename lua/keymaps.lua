-- Keymaps
local s = { silent = true }

vim.g.mapleader = " "

-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`
-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Use <leader>pv to return to file buffer from file
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", '<C-d>', '<C-d>zz')
vim.keymap.set("n", '<C-u>', '<C-u>zz')

vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>", s) -- Save current file 
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", s) -- Quit Neovim
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<space>", "<nop>")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definiton()<CR>", opts)

-- Vim Fugitive
vim.keymap.set("n", "<leader>G", '<cmd>Git<CR>', opts)

-- Neo-tree
vim.keymap.set("n", "<leader>t", function()
    local neotree_open = false
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
            neotree_open = true
            break
        end
    end

    if neotree_open then
        -- If your cursor is already inside Neo-tree, close it
        if vim.bo.filetype == "neo-tree" then
            vim.cmd("Neotree close")
        else
            -- If Neo-tree is open but you are in a code file, jump into the tree
            vim.cmd("Neotree focus")
        end
    else
        vim.cmd("Neotree reveal")
    end
end, { silent = true, desc = "Toggle & Focus Neo-tree" })
