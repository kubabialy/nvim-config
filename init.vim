""" PLUGINS """
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

Plug 'prettier/vim-prettier'

Plug 'Badacadabra/vim-archery'
Plug 'jdsimcoe/abstract.vim'
Plug 'vim-scripts/wombat256.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'morhetz/gruvbox'
Plug 'andreasvc/vim-256noir'
Plug 'isobit/vim-darcula-colors'
Plug 'nikolvs/vim-sunbather'
Plug 'ajmwagar/vim-deus'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-scripts/pyte'
Plug 'rakr/vim-one'
Plug 'jonathanfilip/vim-lucius'

Plug 'preservim/nerdtree'
Plug 'yegappan/mru'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-fugitive'
Plug 'posva/vim-vue'

call plug#end()


""" KEY BINDS """

"" NEDRTree
" Open tree on start
autocmd VimEnter * if argc() == 0 && !exists('s:std_id') | NERDTree | endif

" toggle tree on ctrl + t
map <C-t> :NERDTreeToggle<CR>


"" COC
" Jumping between diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Tab for completion
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordrg . ' ' . expand('<cword>')
    endif
endfunction

autocmd CursorHold * silent cal CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

" Jumping between definitions etc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Back to previous buffer
nnoremap <silent> <C-b> :b#<CR>

"" FZF fuzzy file search
nnoremap <silent> <C-f> :Files<CR>

"" AG in files search
map <C-a> :Ag<CR>

"" TERM
map <C-c> :terminal<CR>
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

""" VARIABLES

set encoding=UTF-8
set background=dark
set termguicolors
colorscheme gruvbox
set nobackup
set nowritebackup
set cmdheight=2
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

set listchars=nbsp:¬,extends:»,precedes:«,trail:•

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')


""" FUNCTIONS
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~# '\s'
endfunction
