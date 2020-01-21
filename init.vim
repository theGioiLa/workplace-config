call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/scrooloose/nerdcommenter.git'

Plug 'dracula/vim', { 'as': 'dracula' }

" Bazel build tools"
" Plug 'google/vim-maktaba'
" Plug 'bazelbuild/vim-bazel'

" Plug 'mhartington/oceanic-next'


call plug#end()


"------------------------------------
"*** Auto copy-paste on clipboard ***
"------------------------------------
set clipboard=unnamedplus


"------------------------------------
"********* Normal Settings **********
"------------------------------------
set autoindent
set number


" Tab size
set tabstop=4 " Tab with is 4
set shiftwidth=4 " Indent will have a width of 4
set softtabstop=4 " Set the number of columns for a Tab
set expandtab " Expand Tabs to spaces


" Backspace problem
set backspace=2


"------------------------------------
"**** For moving between windows ****
"------------------------------------
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l


"------------------------------------
"************ For NodeJS ************
"------------------------------------
au BufNewFile,BufRead *.handlebars set filetype=html


"------------------------------------
"********* Folding SETTINGS *********
"------------------------------------
set foldmethod=syntax
set foldlevelstart=1

" let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
let python_syntax_folding=1      " XML


filetype plugin indent on
syntax on

let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0


"------------------------------------
" ******** NERDTree SETTINGS ********
"------------------------------------
" For auto open NERDTree
" autocmd vimenter * NERDTree

" For map open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" For close NERDTree window automatic
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"-----------------------------------
"******* For YouCompleteMe *********
"-----------------------------------
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_filepath_completion_use_working_dir=1
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let g:ycm_filetype_blacklist={'python': 1}


"-----------------------------------
"******* For Fuzzy Finder  *********
"-----------------------------------
set rtp+=~/.fzf
map <C-f> :FZF<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

"-----------------------------------
"*********** For Prolog ************
"-----------------------------------
au FileType perl set filetype=prolog

set background=dark
imap jk <Esc>
imap Jk <Esc>
imap JK <Esc>
imap jK <Esc>
imap kj <Esc>
imap Kj <Esc>
imap KJ <Esc>

"-----------------------------------
"*********** For Airline ***********
"-----------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

"-------------Map Buffer------------
map <silent> gt :bnext<CR>
map <silent> gT :bprevious<CR>

"-------------Switch between termial and normal mode -----
tnoremap <c-v> <c-\><c-n>

"--------------Rust Formatting Auto-----------"
let g:rustfmt_autosave = 1

"--------------NodeJs Auto Complete ----------"
let g:javascript_plugin_flow = 1
" autocmd FileType javascript 
let g:SuperTabDefaultCompletionType = "<c-x><c-o>" 
set completeopt-=preview 

"------------Syntastic------------------"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.less,*.json,*.html PrettierAsync

if (has("termguicolors"))
    set termguicolors
endif

syntax enable
" colorscheme desert

autocmd FileType json syntax match Comment +\/\/.\+$+
