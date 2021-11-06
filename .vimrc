set nocompatible
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged/')

" GitHub Plugins:
Plug 'rafi/awesome-vim-colorschemes'
Plug 'ahayman/thesaurus_query.vim'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'

" Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'LumaKernel/fern-mapping-fzf.vim'
Plug 'lambdalisue/fern-hijack.vim'

" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()

" Coc


let g:coc_global_extensions = [ 'coc-tsserver', 'coc-json', 'coc-html', 'coc-eslint', 'coc-css', 'coc-markdownlint', 'coc-prisma', 'coc-sourcekit', 'coc-vimlsp', 'coc-sh', 'coc-html-css-support', 'coc-sql', 'coc-yaml' ]
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Use K to show documentation in preview window.
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

filetype plugin on
syntax on
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Fern Settings
let g:fern#renderer = "nerdfont"
nnoremap <expr> <D-f> ":Fern . -drawer -toggle\<CR>"

" fzf settings
set wildignore+=*/.git/*,*/.idea/*,*/.DS_Store,*/node_modules/*,*/dist/*,*/ios/*,*/android/*
let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")' : [ '<c-t>'], 'AcceptSelection("t")' : ['<cr>', '<2-LeftMouse>'], } " opens in new tab by default
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_map = '<D-p>'

inoremap <expr> <TAB> pumvisible() ? "\<C-n>\<C-y>" : "\<TAB>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" Markdown Syntax Folding - useful for outlining
let g:markdown_folding = 1
au FileType markdown setlocal foldlevel=99

set wrap linebreak
autocmd FileType markdown setlocal spell
set number
set guitablabel=\[%N\]\ %t\ %M 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='gruvbox_material'
let java_ignore_javadoc=1

" Thesaurus Lookup parameters
let g:tq_merriam_webster_api_key='c65806b9-fb13-42ec-a16b-bd75c80c997a'
let g:tq_enabled_backends=["merriam_webster", "mthesaur_txt"]
let g:tq_cache_results=0

nnoremap <D-d> :Goyo<CR>
nnoremap <leader>fs z=
nnoremap <C-t> "=strftime('%F %T')<C-M>p
inoremap <C-t> <C-R>=strftime('%F %T')<CR>

" Tab navigation
nnoremap <D-]> gt
nnoremap <D-[> gT

set signcolumn=yes

let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
set bg=dark
