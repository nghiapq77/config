set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'preservim/nerdtree'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/goyo.vim'
Plugin 'tomasiser/vim-code-dark'
Bundle 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

""" Put your non-Plugin stuff after this line
""" theme
colorscheme codedark

""" space key as leader
let mapleader = " "

""" map Escape to jk
imap jk <Esc>

""" disable Ex mode
map Q <Nop>

""" set relative line number
set number relativenumber

""" 4 spaces as tab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

""" enable syntax highlighting
syntax enable

""" indent when moving to the next line while writing code
set autoindent

""" show the matching part of the pair for [] {} and ()
set showmatch

""" enable all Python syntax highlighting features
let python_highlight_all = 1

""" python commenting
map <leader>cc :s/^/# /<CR>
map <leader>cu :s/^# /<CR>

""" goyo
map <leader>z :Goyo<CR>

""" nerdtree
" toggle
map <C-n> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" easymotion prefix as leader
map <Leader> <Plug>(easymotion-prefix)

""" show tab number
if exists("+showtabline")
    function MyTabLine()
        let s = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= '%' . i . 'T'
        let s .= (i == t ? '%1*' : '%2*')
        let s .= ' '
        let s .= i . ':'
        let bufnr = buflist[winnr - 1]
        let file = bufname(bufnr)
        let buftype = getbufvar(bufnr, 'buftype')
        if buftype == 'nofile'
            if file =~ '\/.'
            let file = substitute(file, '.*\/\ze.', '', '')
            endif
        else
            let file = fnamemodify(file, ':p:t')
        endif
        if file == ''
            let file = '[No Name]'
        endif
        let s .= file
        let s .= ' |'
        let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    map    <C-t>    :tabnext<CR>
    imap   <C-t>    <C-O>:tabnext<CR>
    map    <C-S-t>  :tabprev<CR>
    imap   <C-S-t>  <C-O>:tabprev<CR>
endif

