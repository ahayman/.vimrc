 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ----------------------
" VIM configuration file
" ----------------------
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Vundle required settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 Bundle 'LaTeX-Box-Team/LaTeX-Box'
 Bundle 'Lokaltog/powerline'
 Bundle 'SirVer/ultisnips'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
 Bundle 'jnurmine/Zenburn'
 Bundle 'jnwhiteh/vim-golang'
 Bundle 'joelpet/vim-ft-config'
 Bundle 'kien/ctrlp.vim'
 Bundle 'mileszs/ack.vim'
 Bundle 'nathanaelkane/vim-indent-guides'
 Bundle 'sandeepcr529/Buffet.vim'
 Bundle 'scrooloose/nerdcommenter'
 Bundle 'scrooloose/nerdtree'
 Bundle 'scrooloose/syntastic'
 Bundle 'sukima/xmledit'
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-repeat'
 Bundle 'tpope/vim-surround'
 Bundle 'tsaleh/vim-matchit'
 Bundle 'vim-scripts/darkspectrum'
 Bundle 'vim-scripts/taglist.vim'
 Bundle 'vim-scripts/repmo.vim'
 Bundle 'wincent/Command-T.git'
 Bundle 'eraserhd/vim-ios.git'
 Bundle 'dylancopeland/fruitstrap.git'
 Bundle 'vim-scripts/kiwi.vim.git'
 " Node.js bundles
 Bundle 'teramako/jscomplete-vim'
 Bundle 'jelera/vim-javascript-syntax.git'
 Bundle 'wavded/vim-stylus.git'
 Bundle 'myhere/vim-nodejs-complete.git'
 Bundle 'guileen/vim-node.git'
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 Bundle 'Valloric/YouCompleteMe.git'
 Bundle 'msanders/cocoa.vim.git'

 " Colors and fonts
 if has("gui_running")
     colorscheme Twilight
     set transparency=15
     set noantialias
 else
     colorscheme twilight256
 endif

 set guifont=Monaco:h12

 " vim-nodejs-complete 
 "let g:nodejs_complete_config = {'js_compl_fn': 'jscomplete#CompleteJS', 'max_node_compl_len': 100}

 filetype plugin indent on     " required!

" let mapleader = ","
" let g:mapleader = ","

 " Fast saving
 nmap <leader>w :w!<cr>

 let tlist_objc_settings = 'ObjectiveC;i:interface;c:class;m:method;p:property;I:implementation;v:variable;f:function;e:enumeration;M:macro'
 let g:ycm_confirm_extra_conf = 0
 " => General settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible "drop compatibility for Vi 
set ignorecase "ignore case on searches and everywhere else
set infercase "make insert-matching preserve the already written characters
set mouse=a "enable the mouse in compatible terms for all modes
set number "enable line numbers
set smartcase "enable case sensitive search if pattern contains upper case
set wildmenu "show possible completion matches
set wildmode=list:longest "list all matches and complete to longest common string
set scrolloff=7 "minimal number of screen lines to keep above/below the cursor 
set hidden "This will allow you to switch buffers without saving.  Though you have to use 'qall!' to exit all unsaved buffers
set lazyredraw
set hlsearch
set magic


syntax on
" => Indenting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent "copy indent from current line when starting a new line
set tabstop=4 "number of spaces that a <Tab> in the file counts for
set softtabstop=4 "number of spaces that a <Tab> counts for while performing editing operations
set shiftwidth=4 "number of spaces to use for each step of (auto)indent
set expandtab "use the appropriate number of spaces to insert a <Tab>.
set smarttab "makes a <Tab> in front of a line insert blanks according to 'shiftwidth'

" Node & Javascript settings
au FileType javascript set dictionary+=$HOME/.vim/dict/node.dict

" Quick Escape
inoremap jk <Esc>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
 vnoremap <silent> * :call VisualSelection('f')<CR>
 vnoremap <silent> # :call VisualSelection('b')<CR>

 " Treat long lines as break lines (useful when moving around in them)
 map j gj
 map k gk

"Move lines of code around
 map <D-j> ddp
 map <D-k> ddkP
 nmap <D-j> mz:m+<cr>`z
 nmap <D-k> mz:m-2<cr>`z
 vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
 vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
 vmap <C-c> "*y
"if has("mac") || has("macunix")
"    map <D-j> <M-j>
"    map <D-k <M-k>
"    nmap <D-j> <M-j>
"    nmap <D-k> <M-k>
"    vmap <D-j> <M-j>
"    vmap <D-k> <M-k>
"endif

 "Disable Highlight
map <silent> <leader><cr> :noh<cr>

 " NERD Tree
  """"""""""""""""""""""""""""""
  "Toggle NERD Tree on/off
  nmap <silent> <F4> :NERDTreeToggle<CR> 
  "Filter uninteresting files
  let NERDTreeIgnore = ['\.class$']

"Empyt Lines 
map <Enter> o<Esc>
"map <S-Enter> O<Esc>
 "Window Key Mappings
noremap <silent> <leader>h :wincmd h<cr>
noremap <silent> <leader>j :wincmd j<cr>
noremap <silent> <leader>k :wincmd k<cr>
noremap <silent> <leader>l :wincmd l<cr>

noremap <silent> <leader>cc :close<cr>
" Move the current window to the right of the main Vim window
noremap <silent> <leader>ml <C-W>L
noremap <silent> <leader>mk <C-W>K
noremap <silent> <leader>mh <C-W>H
noremap <silent> <leader>mj <C-W>J

 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
filetype plugin on

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
