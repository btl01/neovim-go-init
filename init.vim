let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = ","

filetype on
filetype indent on
filetype plugin on

set encoding=UTF-8

" Coc
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=number
set ignorecase

nmap <silent> gr <Plug>(coc-references)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> rn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> (Enter) auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" End Coc

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

syntax on
set nocompatible
set hlsearch
set number relativenumber
set laststatus=2
set vb
set ruler
set spelllang=en_us
set autoindent
set mouse=a
set clipboard=unnamed
set noscrollbind
set wildmenu
set autochdir

hi Search cterm=NONE ctermfg=black ctermbg=red

" netrw

nnoremap <F3> :Lex<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete

"-- netrw END

" plug 
call plug#begin()
Plug 'vim-airline/vim-airline' " https://github.com/vim-airline/vim-airline
Plug 'ctrlpvim/ctrlp.vim'      " https://github.com/ctrlpvim/ctrlp.vim
Plug 'ryanoasis/vim-devicons'  " https://github.com/ryanoasis/vim-devicons + https://github.com/ryanoasis/nerd-fonts/
Plug 'tpope/vim-commentary'    " https://github.com/tpope/vim-commentary
Plug 'airblade/vim-gitgutter'  " https://github.com/airblade/vim-gitgutter
Plug 'windwp/nvim-autopairs'   " https://github.com/windwp/nvim-autopairs

"> Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' } " https://github.com/fatih/vim-go
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " https://github.com/neoclide/coc.nvim

"> Theme
Plug 'tomasiser/vim-code-dark'
call plug#end()

"-- plug END

let g:coc_global_extensions = [
		\ 'coc-snippets',
		\ 'coc-go'
	  \ ]

lua << EOF
require("nvim-autopairs").setup({ map_cr = false })
EOF

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-gitgutter

set updatetime=500

"-- vim-gitgutter END

colorscheme codedark
hi nonText      ctermbg=none  guibg=none
hi Normal       ctermbg=none  guibg=none
hi CursorLineNr               guibg=none
hi EndOfBuffer  ctermbg=none  guibg=none
hi Folded                     guibg=none
hi LineNr       ctermbg=none  guibg=none
hi SignColumn   ctermbg=none  guibg=none
