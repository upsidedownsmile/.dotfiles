-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    view = {
        relativenumber = true,
        width = 70
    },
    git = {
        enable = true,
        ignore = false
    },
    renderer = {
        symlink_destination = true,
        icons = {
            symlink_arrow = " → "
        }
    }
})

local function open_nvim_tree()
    -- always open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
