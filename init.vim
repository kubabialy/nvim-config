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

Plug 'tjdevries/colorbuddy.vim'

Plug 'tyrannicaltoucan/vim-deep-space'

Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-colors-rakr'
Plug 'jdsimcoe/abstract.vim'
Plug 'folke/tokyonight.nvim'
Plug 'preservim/nerdtree'
Plug 'nlknguyen/papercolor-theme'
Plug 'yegappan/mru'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'jesseduffield/lazygit'
Plug 'kdheepak/lazygit.nvim'
Plug 'nelsyeung/twig.vim'
Plug 'tpope/vim-commentary'
" Colorscheme
Plug 'blackbirdtheme/vim'
Plug 'github/copilot.vim'
Plug 'felixhummel/setcolors.vim'
Plug 'pineapplegiant/spaceduck'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

"" NEDRTree
" toggle tree on ctrl + t
map <C-t> :NERDTreeToggle<CR>

"" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

noremap <silent><expr> <TAB>
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

"" TERM
map <C-c> :terminal<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
""" VARIABLES
set background=dark

lua << EOF
require("catppuccin").setup {
    flavour = "macchiato" -- mocha, macchiato, frappe, latter
}
EOF

colorscheme gruvbox

hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none


" highlight ColorColumn ctermbg=0 guibg=none
" hi SignColumn guibg=none
" hi CursorLineNR guibg=None
" " highlight Normal guibg=none
" highlight LineNr guifg=#ff8659
" highlight LineNr guifg=#aed75f
" highlight LineNr guifg=#5eacd3
" highlight netrwDir guifg=#5eacd3
" highlight qfFileName guifg=#aed75f
" hi TelescopeBorder guifg=#5eacd
set guifont=DroidSansMono_Nerd_Font:h11
set encoding=UTF-8
set termguicolors
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
set shiftwidth=2
set softtabstop=4
set nohlsearch
set hidden
set nowrap
set noerrorbells
set incsearch
set scrolloff=12
" hi Normal ctermbg=NONE

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

nmap <leader>ac  <Plug>(coc-codeaction)
""" FUNCTIONS
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

"" LAZY GIT""
nnoremap <silent> <leader>gg :LazyGit<CR>
autocmd FileType markdown let b:coc_suggest_disable = 1
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
