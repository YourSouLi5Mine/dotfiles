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
Plug 'posva/vim-vue'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'szw/vim-maximizer'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mhinz/vim-grepper'
Plug 'ap/vim-css-color'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
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

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>
nmap <silent> <leader>ta :TestSuite<CR>

nnoremap <leader>ag  :Grepper -tool ag -highlight<cr>
nnoremap <leader>gg  :Grepper -tool git -highlight<cr>
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gi :G<CR>

nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

imap jj <Esc>

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

let test#strategy = "dispatch"

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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
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

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>cac  <Plug>(coc-codeaction)
nmap <leader>cqf  <Plug>(coc-fix-current)
nmap <leader>ccl  <Plug>(coc-codelens-action)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

hi Normal guibg=NONE ctermbg=NONE

colorscheme dracula
