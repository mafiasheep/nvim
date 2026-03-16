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
            "build",
            ".git",
            "venv",
            "__pycache__",
        },
    },
})
