local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup({
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "dist",
            "build/",
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
