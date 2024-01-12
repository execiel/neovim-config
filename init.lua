----------------------------
-- Execiels neovim config --
----------------------------

-- Shorthand for vim functions
local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

-----------------
-- VIM OPTIONS --
-----------------

-- disable netrw at the very start of your init.lua (NvimTree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- opt.guifont = { "CaskaydiaCove NF", "h15" }
o.termguicolors = true
o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 15

-- UI
o.number = true
o.numberwidth = 1
o.relativenumber = true
o.signcolumn = 'no'
o.cursorline = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = false
o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1
o.list = true
o.clipboard = 'unnamedplus'
o.ignorecase = true
o.smartcase = true

-- Undo and backup
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '


-----------------
-- KEYBINDINGS --
-----------------

local function map(m, k, v)
   vim.keymap.set(m, k, v, { silent = true })
end

-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')

-- Keybindings for telescope
map('n', '<leader>fr', '<CMD>Telescope oldfiles<CR>')
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>')
map('n', '<leader>fw', '<CMD>Telescope live_grep<CR>')
map('n', '<leader>ht', '<CMD>Telescope colorscheme<CR>')

-- Navigation
map('n', '<leader>w', '<C-w>')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

-- Tabs
map('n', '<leader>tn', '<CMD>tabnew<CR>')
map('n', '<leader>th', '<CMD>tabnext<CR>')
map('n', '<leader>tl', '<CMD>tabprevious<CR>')

-- Resizing
map('n', '<leader>rj', '<CMD>resize -5<CR>')
map('n', '<leader>rk', '<CMD>resize +5<CR>')
map('n', '<leader>rl', '<CMD>vertical resize +5<CR>')
map('n', '<leader>rh', '<CMD>vertical resize -5<CR>')

-- Editor stuff
map("i", '<C-s>', "<Esc> <CMD>w<CR> <CMD>call CocAction('runCommand', 'prettier.formatFile')<CR>" )
map("n", '<C-s>', "<CMD>w<CR> <CMD>call CocAction('runCommand', 'prettier.formatFile')<CR>" )
map('n', '<C-e>', "<CMD>q<CR>")
map('n', '<Esc>', "i")

-- Terminal stuff
map('n', '<leader>st', "<CMD>tabnew<CR><CMD>terminal<CR>")
map('t', '<Esc>', [[<C-\><C-N>]])
map('t', '<C-e>', "<CMD>terminal exit<CR><CMD>tabclose<CR>")

-- Git stuff (will execute from root folder, use with caution)
map('n', '<leader>gi', "<CMD>!git init<CR>")
map('n', '<leader>gaa', "<CMD>!git add -A<CR>")
map('n', '<leader>ga', "<CMD>!git add $(git diff --name-only --cached)<CR>")
map('n', '<leader>lg', "<CMD>tabnew<CR><CMD>terminal<CR>i lazygit<CR>")

-- Toggle Plugins
map('n', '<C-z>', "<CMD>Goyo<CR>")
map('n', '<leader>b', "<CMD>:silent! NvimTreeToggle<CR>")
map('n', '<tab>', "<CMD>:silent! NvimTreeToggle<CR>")

-- Brackets and qoutes
map('i', '"', '""<left>')
map('i', "'", "''<left>")
map('i', '`', '``<left>')
map('i', '(', '()<left>')
map('i', '{', '{}<left>')
map('i', '[', '[]<left>')

-------------
-- Plugins --
-------------

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
  -- Editor stuff
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug('neoclide/coc.nvim', {branch = 'release'})
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'honza/vim-snippets'
  Plug 'SirVer/ultisnips'

  -- File, buffer and window related plugins
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jreybert/vimagit'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'manzeloth/live-server'
  Plug('nvim-telescope/telescope.nvim', { tag = '0.1.2' })
  Plug 'nvim-telescope/telescope-file-browser.nvim'
  Plug 'puremourning/vimspector'
  Plug 'akinsho/bufferline.nvim'

  -- Syntax highlighting
  Plug('nvim-treesitter/nvim-treesitter')
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'kovetskiy/sxhkd-vim'
  Plug 'vim-python/python-syntax'
  Plug 'ap/vim-css-color'
  Plug 'Fymyte/rasi.vim'
  Plug 'frazrepo/vim-rainbow'

  -- Janegunn mvp osv
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/vim-emoji'

  -- Themes and aestethics
  Plug 'eddyekofo94/gruvbox-flat.nvim'
  Plug 'nyoom-engineering/oxocarbon.nvim'
  Plug 'rebelot/kanagawa.nvim'
  Plug 'savq/melange-nvim'
  Plug 'folke/tokyonight.nvim'
  Plug 'catppuccin/nvim'
vim.call('plug#end')

------------------
-- COLORSCHEMES --
------------------
vim.cmd("colorscheme tokyonight-moon")
vim.cmd("set scrolloff=15")
-- vim.cmd("hi Normal guibg=none ctermbg=none")

-- Highlight copied section
A.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-------------------
-- PLUGIN CONFIG --
-------------------

-- Buffer-line config
local bufferline = require('bufferline')
bufferline.setup({
  options = {
    mode = 'tabs',
    numbers = 'none',
    close_command = 'Bdelete! %d',
    right_mouse_command = 'Bdelete! %d',
    left_mouse_command = 'tabn %d',
    middle_mouse_command = nil,
    indicator = {
      style = 'icon',
      icon = '▎',
      buffer_close_icon = ' ',
      modified_icon = '●',
      close_icon = ' ',
      left_trunc_marker = '<-', --'',
      right_trunc_marker = '->', --'',
    },
    offsets = {{filetype = "NvimTree", text = "Files", text_align = "center", padding = 1}},
    color_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin", -- "slant",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    sort_by = 'id',
  },
})

-- Nvim Tree setup

vim.g.nvim_tree_respect_buf_cwd = 1

-- Sets up custom keybinds for nvim tree
local function nvim_tree_keybinds(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<tab>',     api.tree.close,                  opts('Help'))
  vim.keymap.set('n', '<leader>r', api.tree.change_root_to_node,            opts('Up'))
  vim.keymap.set('n', 's', api.node.open.vertical,            opts('Open in vertical split'))
  vim.keymap.set('n', '<C-s>', api.node.open.horizontal,            opts('Open in vertical split'))
  vim.keymap.set('n', 't', api.node.open.tab,            opts('Open in new tab'))
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  on_attach = nvim_tree_keybinds,
  -- respect_buf_cwd = true,
  -- sync_root_with_cwd = true,
  prefer_startup_root = true,
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    indent_width = 0,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  glyphs = {
    default = "",
    symlink = "",
    bookmark = "󰆤",
    modified = "●",
    folder = {
      arrow_closed = "",
      arrow_open = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌",
    },
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
})

-- Treesitter Setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  --ignore_install = {"python"},
  sync_install = false,
  highlight = {
    enable = true,
    --disable = {"python"},
    additional_vim_regex_highlighting = false,
  },
}

-- vim.cmd("NvimTreeOpen")

-- Lualine setup
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = ' ', right = ' '},
    disabled_filetypes = {
      statusline = {"packer", "NvimTree", "Goyo"},
      winbar = {"packer", "NvimTree"},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filetype', 'diagnostics'}, --{'filetype', icon_only = true}
    -- fileformat...
    lualine_x = {'encoding'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
