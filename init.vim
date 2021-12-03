"" PLUGINS call plug#begin(stdpath('data') . '/plugged')
call plug#begin(stdpath('data') . '/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Rest
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'andreasvc/vim-256noir'
Plug 'jdsimcoe/abstract.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'isobit/vim-darcula-colors'
Plug 'preservim/nerdtree'
Plug 'ajmwagar/vim-deus'
Plug 'nlknguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'yegappan/mru'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
"" "Plug 'tpope/vim-fugitive'
Plug 'jesseduffield/lazygit'
Plug 'kdheepak/lazygit.nvim'
Plug 'posva/vim-vue'
Plug 'vim-scripts/wombat256.vim'
"Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'nelsyeung/twig.vim'
" Plug 'tpope/vim-commentary'
" Colorscheme
Plug 'blackbirdtheme/vim'
Plug 'github/copilot.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'pineapplegiant/spaceduck'

call plug#end()

"" NEDRTree
" toggle tree on ctrl + t
map <C-t> :NERDTreeToggle<CR>

"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"" TERM
map <C-c> :terminal<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
""" VARIABLES
set guifont=DroidSansMono_Nerd_Font:h11
set encoding=UTF-8
colorscheme Atelier_DuneDark
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set colorcolumn=120
set signcolumn=yes
set showcmd
set mouse=a
set number
set relativenumber
set nu
set expandtab
set shiftwidth=4
set softtabstop=4
set nohlsearch
set hidden
set nowrap
set noerrorbells
set incsearch
set scrolloff=12

""" FUNCTIONS
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

"" LAZY GIT""
nnoremap <silent> <leader>gg :LazyGit<CR>

lua << EOF
require'lspconfig'.intelephense.setup{}
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'intelephense', 'tsserver', 'gopls' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
