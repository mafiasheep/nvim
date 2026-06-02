-- Plugins
vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/m4xshen/autoclose.nvim" },
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/telescope-nvim/telescope.nvim" },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range('3') },
})

require('gitsigns').setup({ signcolumn = false })
require('mason').setup({})
require('autoclose').setup({})
require('tokyonight').setup({
    transparent_background = true,
    float = {
        transparent = true,
        solid = false,
    },
}, vim.cmd('colorscheme tokyonight-night'))

require('neo-tree').setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    default_source = "filesystem",
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
    },
    window = {
        position = "left",
        width = 40,
    }
})

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "build",
            "%.git",
            "venv",
            "%.venv",
            "cdk%.out",
            "site%-packages",
            "__pycache__",
        },
    },

    pickers = {
        find_files = {
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--follow",
                "--glob", "!**/site-packages/*",
                "--glob", "!**/.venv/*",
                "--glob", "!**/venv/*",
                "--glob", "!**/node_modules/*",
                "--glob", "!**/cdk.out/*",
            },
        },
        live_grep = {
            additional_args = function()
                return {
                    "--hidden",
                    "--follow",
                    "--glob", "!**/site-packages/*",
                    "--glob", "!**/.venv/*",
                    "--glob", "!**/venv/*",
                    "--glob", "!**/node_modules/*",
                    "--glob", "!**/cdk.out/*",
                }
            end,
        },
    },
})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        ["<C-space"] = {},
        ["<C-p"] = {},
        ["<Tab>"] = { "select_and_accept" },
        ["<S-Tab>"] = {},
        ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-n>"] = {},
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-b>"] = { "scroll_documentation_down", "fallback" },
        ["<C-f>"] = { "scroll_documentation_up", "fallback" },
        ["<C-l>"] = { "snippet_forward", "fallback" },
        ["<C-h>"] = { "snippet_backward", "fallback" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp" } }
})
