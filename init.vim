set title
set hidden
set number
set relativenumber
set colorcolumn=120
set nocompatible

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

set ignorecase
set smartcase
set termguicolors
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set cmdheight=2
set updatetime=300
set shortmess+=c

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:polyglot_disabled = ['markdown']

call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mhinz/vim-grepper'
Plug 'ap/vim-css-color'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'preservim/nerdcommenter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-obsession'
Plug 'edkolev/tmuxline.vim'
call plug#end()

let mapleader=" "

nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap <leader>u :UndotreeToggle<CR>

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>
map <silent> <leader>l :wincmd l<CR>

map - <C-W>-
map + <C-W>+

nnoremap <silent> <leader>vr :vertical resize 30<CR>
nnoremap <silent> <leader>r+ :vertical resize +5<CR>
nnoremap <silent> <leader>r- :vertical resize -5<CR>

noremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nmap <C-p> :FZF<CR>

nnoremap <leader>er :call EmptyRegisters()<CR>

nmap <F3> :set hls!<CR>

nnoremap <leader>ag  :Grepper -tool ag -highlight<cr>
nnoremap <leader>gg  :Grepper -tool git -highlight<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

let g:qf_mapping_ack_style = 1

nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nmap <leader>xc :let @+ = expand("%")<CR>

map 0 ^

command! ClearQuickfixList cexpr []
nmap <leader>cf :ClearQuickfixList<CR>

fun! EmptyRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"*+', '\zs')
  for r in regs
    call setreg(r, [])
  endfor
endfun

if has("persistent_undo")
  set undodir=$HOME/.undodir
  set undofile
endif

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
  \ quit | endif

autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
  \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:undotree_ShortIndicators = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_RelativeTimestamp = 1
let g:undotree_WindowLayout = 2
let g:undotree_HelpLine = 0

let NERDTreeMinimalUI = 1

let g:airline_theme = 'dracula'
let g:airline_powerline_fonts = 1
let g:tmuxline_preset = {
\  'a'   : '[#S]',
\  'win' : '#I  #W#F',
\  'cwin': '#I  #W#F',
\  'options': {
\    'status-justify': 'left'
\  }
\}
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]   = '<C-j>'
let g:VM_maps["Add Cursor Up"]     = '<C-k>'

let g:startify_bookmarks = [
\  { 'v': '~/.config/nvim/init.vim' },
\  { 'z': '~/.zshrc' },
\  { 't': '~/.tmux.conf' },
\  { 'i': '~/.gitignore' },
\]

function! AirlineInit()
  let g:airline_section_b = airline#section#create_left(['', 'hunks'])
endfunction
autocmd VimEnter * call AirlineInit()

hi Normal guibg=NONE ctermbg=NONE

colorscheme dracula
