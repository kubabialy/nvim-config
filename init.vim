"" PLUGINS call plug#begin(stdpath('data') . '/plugged')
call plug#begin(stdpath('data') . '/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Rest
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'
Plug 'vim-scripts/wombat256.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'flazz/vim-colorschemes'
Plug 'nelsyeung/twig.vim'

" Colorscheme
Plug 'blackbirdtheme/vim'

call plug#end()

"" NEDRTree
" Open tree on start
autocmd VimEnter * if argc() == 0 && !exists('s:std_id') | NERDTree | endif
" toggle tree on ctrl + t
map <C-t> :NERDTreeToggle<CR>

"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

map <C-e> :Mru <CR>
"" COC
" Tab for completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Jumping between definitions etc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"" Back to previous buffer
nnoremap <silent> <C-b> :b#<CR>
"" TERM
map <C-c> :terminal<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
""" VARIABLES
set guifont=DroidSansMono_Nerd_Font:h11
set encoding=UTF-8
colorscheme gruvbox
set nobackup
set nowritebackup
set cmdheight=4
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
set shiftwidth=2
set softtabstop=2
set nohlsearch
set hidden
set nowrap
set noerrorbells
set incsearch
set scrolloff=12
set listchars=nbsp:¬¨,extends:¬ª,precedes:¬´,trail:‚Ä¢
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
""" FUNCTIONS
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction


"command! -nargs=0 Prettier :CocCommand prettier.formatFile
