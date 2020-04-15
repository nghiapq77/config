set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

""" Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'junegunn/goyo.vim'
    Plugin 'tomasiser/vim-code-dark'
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required
filetype plugin indent on    " required

""" move .viminfo to .vim/viminfo
set viminfo+=n~/.vim/viminfo

""" theme
colorscheme codedark

""" space key as leader
let mapleader = " "

""" map Escape to jk
imap jk <Esc>

""" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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

""" vim tabs, used in status line
function MyTabLine()
    let s = ''
    let t = tabpagenr()
    let i = 1
    while i <= tabpagenr('$')
        let buflist = tabpagebuflist(i)
        let winnr = tabpagewinnr(i)
        let s .= (i == t ? '[*' : '')
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
            let file = 'No Name'
        endif
        let s .= file
        let s .= (i == t ? ']' : '')
        let s .= ' | '
        let i = i + 1
    endwhile
    return s
endfunction
map    <C-t>    :tabnext<CR>
imap   <C-t>    <C-O>:tabnext<CR>
map    <C-S-t>  :tabprev<CR>
imap   <C-S-t>  <C-O>:tabprev<CR>
" hide actual tabline
set showtabline=0

""" status line
function! GitBranch()
      return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#\   
set statusline+=%{MyTabLine()}
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
set laststatus=2

""" CoC
" TextEdit might fail if hidden is not set.
set hidden

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
   let col = col('.') - 1
   return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

" go to definition
nmap <leader>gd <Plug>(coc-definition)

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
" set signcolumn=yes
