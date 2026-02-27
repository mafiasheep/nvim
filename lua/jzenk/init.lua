require("jzenk.keymap")
require("jzenk.packer")
require("jzenk.set")

print("hello jzenk")

vim.lsp.config('luals', {
  cmd = {'lua-language-server'},
  filetypes = {'lua'},
  root_markers = {'.luarc.json', '.luarc.jsonc'},
})

vim.lsp.enable('luals')
