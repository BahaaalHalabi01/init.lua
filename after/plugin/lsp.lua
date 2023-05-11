local lsp = require('lsp-zero').preset("recommended")

require('lspconfig')
lsp.ensure_installed({
    'tsserver',
    'rust_analyzer'
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
    }),
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }
})
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>le', vim.diagnostic.open_float, { desc = 'diagnosic float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'prev diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist, { desc = 'diagnostic loc list' })


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
end)
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
vim.diagnostic.config({
    virtual_text = true
})
