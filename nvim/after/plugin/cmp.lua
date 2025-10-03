local cmp = require'cmp'

cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' }
    }),
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] =  cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm()
  }
})

