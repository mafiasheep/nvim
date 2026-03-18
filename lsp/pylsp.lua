return {
    cmd = { 'pylsp' },
    filetypes = { 'python' },
    root_markers = { '.git', 'Makefile' },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    enabled = true,
                    ignore = { 'E302' },
                    maxLineLength = 100,
                },
                jedi = { extra_paths = { 'source' } },
            },
        },
    },
}
