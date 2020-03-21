set nocompatible              " be iMproved, required
filetype off                  " required

" Runtime Path Manipulation
" Runtime Path Manipulation
execute pathogen#infect()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'tpope/vim-commentary'

Plugin 'majutsushi/tagbar'
let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'
nnoremap <leader>t :TagbarOpenAutoClose


Plugin 'itchyny/lightline.vim'
set laststatus=2


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'xuhdev/vim-latex-live-preview'


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


Plugin 'SirVer/ultisnips'
Plugin 'davidhalter/jedi-vim'
Plugin 'jiangmiao/auto-pairs'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'lervag/vimtex'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'terryma/vim-multiple-cursors'


call vundle#end()            " required

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
filetype plugin indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'


" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
syntax on

" Highlight column 80.
set textwidth=100
set t_Co=256
colorscheme molokai
set colorcolumn=80,100
highlight ColorColumn ctermbg=246 guibg=#2d2d2d
highlight Comment ctermfg=green

" autocmd FileType tex nmap <buffer> T :!open -a Skim %<.pdf %<.pdf<CR><CR>
"autocmd FileType tex nmap <buffer> <C-T> :!xelatex %<CR>
autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pdf %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %:r.pdf<CR><CR>

" Remove trailing whitespace on save.
autocmd BufWrite * :%s/\s\+$//e

" View layout of folder
map <C-n> :NERDTreeToggle<CR>

map bf :$

" PDF latex
autocmd Filetype tex setl updatetime=0
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Remove trailing space
"neo for templates of autocomplete
Plugin 'Shougo/deoplete.nvim'
if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_complete_done = 1

"highlight search
set hlsearch
set ignorecase

set formatoptions+=1 " When wrapping paragraphs, don't end lines
                      "with 1-letter words (looks stupid)

set history=1000                " remember more commands and search history

set nobackup                    " do not keep backup files, it's 70's style cluttering
set nowritebackup               " do not write out changes via backup files
set noswapfile                  " do not write annoying intermediate swap files,
                                "    who did ever restore from swap files anyway?
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

set autoread                    " automatically reload files changed outside of Vim

if has('unix')
    set dictionary+=/usr/share/dict/words
else
    set dictionary+=~/AppData/Local/nvim/words
endif

" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC

" <Leader> is \ by default, so those commands can be invoked by doing \v and \s
"

set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" Selected color
hi Visual term=reverse cterm=reverse guibg=Grey

