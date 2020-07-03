" ============================ General Config =========================
filetype plugin on
let g:mapleader = ","           "set leader key to comma

set number                      "line numbers
set hlsearch                    "highlight searching result
set ignorecase                  "ignore Case sensitive when searching
set showmatch                   "highlight matched bracket ()

" ============================ Optional Setting =======================
"set relativenumber              "show relative number from current line
                                "Highly recommended
set history=1000                "store :cmd history
set title                       "change the terminal title
"set cursorline                  "highlight cursor line
set mouse=a                     "Enable mouse in all mode
set wrap
let g:onedark_terminal_italics = 1
syntax sync minlines=200        "For speed up vim
set clipboard=unnamed           "yank, paste to system clipboard

" ============================ Plugins ================================

call plug#begin()

"" Plugin List
Plug 'junegunn/fzf'
Plug 'scrooloose/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'vim-syntastic/syntastic'
Plug 'gryf/pylint-vim'
Plug 'scrooloose/nerdcommenter'

"------- deoplete -------
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-zsh'
Plug 'Shougo/neco-syntax'
Plug 'Shougo/neco-vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } "https://github.com/carlitux/deoplete-ternjs
Plug 'davidhalter/jedi-vim'
Plug 'cocopon/iceberg.vim'
" ----- end -------


call plug#end()

" =========================== Plugins Setting ============================

" NERDTree
"" Dir Arrow 설정
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"" 숨김파일 보이도록 처리
let NERDTreeShowHidden=1

"" Ctrl+n NERD Tree Toggle
map <C-t> :NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:deoplete#sources#ternjs#filetypes = [
                \ 'vue',
                \ ]
" maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

" jedi vim
let g:jedi#completions_enabled = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = "0"   "jedi-vim slowdown

" Syntastic
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>
