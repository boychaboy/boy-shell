"  ============================ General Config =========================
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
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'vim-syntastic/syntastic'
Plug 'gryf/pylint-vim'
Plug 'scrooloose/nerdcommenter'
" Plug 'altercation/vim-colors-solarized' " precision colorscheme for the vim text editor
" Plug 'vim-scripts/indentpython.vim' " auto-indentation
Plug 'Yggdroot/indentLine' " indent line 
" Plug 'numirias/semshi' " semantic highlighting
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'} " r-language

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

"" Ctrl+t NERD Tree Toggle
map <C-t> :NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:deoplete#sources#ternjs#filetypes = [
                \ 'vue',
                \ ]
" maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 100)
" call deoplete#custom#option('auto_complete_delay', 200)

" jedi vim
let g:jedi#completions_enabled = 1
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#show_call_signatures = "0"   "jedi-vim slowdown

" Syntastic
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" vim-smooth-scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>

let g:termdebugg_wide = 163

let g:semshi#simplify_markup = 1


" For Python
"au BufNewFile,BufRead *.py
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=4 |
    "\ set expandtab |
    "\ set autoindent |
    "\ set fileformat=unix
"let python_highlight_all = 1
"" Indent guide plugin setting (https://github.com/nathanaelkane/vim-indent-guides)
"let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
"" For XML
"au BufNewFile,BufRead *.xml
    "\ set tabstop=4 |
    "\ set softtabstop=4 |
    "\ set shiftwidth=4 |
    "\ set expandtab |
    "\ set autoindent |
    "\ set fileformat=unix

" Indent line
let g:indentLine_enabled = 1
let g:indentLine_char = '┊'
let g:indentLine_faster = 1
let g:indentLine_maxLines = 1

" terminal excape key
tnoremap <C-\> <C-\><C-n>
" Untoggle terminal
tnoremap <C-Space> <C-\><C-n>:q!<CR>
tnoremap <C-l> <C-\><C-n>:q!<CR>

" debug trigger
nmap <F9> oimport ipdb; ipdb.set_trace(context=10)<ESC>

set splitright
set splitbelow


" boychaboy key-mapping 
" save
imap <C-s> <ESC>:w<ENTER> 
nmap <C-s> :w<ENTER>
" exit
imap <C-q> <ESC>:q<ENTER> 
nmap <C-q> :q<ENTER>
" force exit
nmap <C-Q> :q!<ENTER>

" prev, next
nmap ≥ :bn<ENTER>
nmap ≤ :bp<ENTER>

" json file formatting
nmap <C-j> :%!python -m json.tool<ENTER>

nmap <C-Space> :sp\|resize 20\|term<CR>i
nmap <C-l> :vsp\|term<CR>i
