vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- require("tokyonight").setup({
--   style = "day",
--   styles = {
--     comments = { italic = false },
--     keywords = { italic = false },
--     functions = { italic = false },
--     variables = { italic = false },
--   }
-- })

vim.opt.termguicolors = true
vim.cmd.colorscheme("gruvbox")
vim.o.background = "dark"

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.keymap.set("n", "<leader>q", ":q!<CR>")
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>c", ':lua WriteToClipboard(LinkToCode(), "Copied code link to clipboard")<CR>')

vim.opt.clipboard = "unnamedplus"

vim.opt.mouse = ""

vim.opt.smartcase = true
vim.opt.ignorecase = true
