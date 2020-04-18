set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required

""" Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'
    Plugin 'Xuyuanp/nerdtree-git-plugin'
    Plugin 'preservim/nerdcommenter'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'junegunn/goyo.vim'
    Plugin 'tomasiser/vim-code-dark'
    Plugin 'arcticicestudio/nord-vim'
    Plugin 'neoclide/coc.nvim', {'branch': 'release'}
    Plugin 'dense-analysis/ale'
    Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required
filetype plugin indent on    " required

""" move .viminfo to .vim/viminfo
set viminfo+=n~/.vim/viminfo

""" theme
colorscheme codedark
"colorscheme nord

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

""" Indentation 
" 4 spaces as tab
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" indent when moving to the next line while writing code
set autoindent

""" enable syntax highlighting
syntax enable

""" show the matching part of the pair for [] {} and ()
set showmatch

""" enable all Python syntax highlighting features
let python_highlight_all = 1

""" goyo
map <leader>z :Goyo<CR>

""" nerdtree
" toggle
map <C-n> :NERDTreeToggle<CR>

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
        let s .= (i == t ? ' | [*' : ' | ')
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
        let i = i + 1
    endwhile
    let s.= ' |'
    return s
endfunction

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

" goto code navigations
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" Use K to show documentation in preview window.
nnoremap <leader> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocActionAsync('doHover')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

""" ALE
" set python linters
let g:ale_linters = {'python': ['flake8', 'pylint']}

" set python fixers
let g:ale_fixers = {'python': ['yapf']}

" map F10 to alefix
nmap <F10> :ALEFix<CR>

" auto fix upon save
let g:ale_fix_on_save = 1

" function that show number of errors and warnings on statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(' %d  %d', all_non_errors, all_errors)
endfunction

""" status line
" hide actual tabline
set showtabline=0

" always show status
set laststatus=2

" git branch info
function! GitBranch()
      return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'   '.l:branchname.' ':''
endfunction

" tab color
highlight PmenuSel ctermfg=15 ctermbg=23

" set statusline
set statusline=
set statusline+=%{StatuslineGit()}
set statusline+=%#PmenuSel#
set statusline+=%{MyTabLine()}
set statusline+=%#LineNr#\   
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{LinterStatus()}
set statusline+=\ %l:%c\ 

