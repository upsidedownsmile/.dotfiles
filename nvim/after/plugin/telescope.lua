require('telescope').setup {
    defaults = {
      layout_strategy = "vertical",
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
    }
  }
}

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')

--vim.keymap.set('n', 'gd', function() builtin.lsp_definitions({wrap_results = true})end, {})
-- vim.keymap.set('n', ',c', function() builtin.lsp_dynamic_workspace_symbols({wrap_results = true})end, {})
vim.keymap.set('n', ',d', function() builtin.lsp_document_symbols({wrap_results = true})end, {})
vim.keymap.set('n', 'gD', function() builtin.lsp_references({wrap_results = true})end, {})
vim.keymap.set('n', 'gi', function() builtin.lsp_implementations({wrap_results = true})end, {})

vim.keymap.set('n', ',f', function ()
    builtin.find_files({find_command = {"ws-git-files"}, wrap_results = true})
end)
vim.keymap.set('n', ',s', function ()
    local fileHandle = assert(io.popen('ws-git-files', 'r'))
    local output  = assert(fileHandle:read('*a'))
    fileHandle:close()

    local dirs = {}
    for s in output:gmatch("[^\r\n]+") do
        table.insert(dirs, s)
    end
    builtin.live_grep({search_dirs = dirs, wrap_results = true})
end)


vim.keymap.set('n', '<leader>pf', function ()
    builtin.find_files({wrap_results = true})
end)
vim.keymap.set('n', '<leader>fpf', function ()
    builtin.live_grep({additional_args = {"--fixed-strings"}})
end)

vim.keymap.set('n', ',c', function ()
    builtin.find_files({search_file = "java", wrap_results = true})
end)
