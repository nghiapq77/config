""" Plugin manager
call plug#begin(stdpath('data') . '/plugged')
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'easymotion/vim-easymotion'
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-surround'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

""" theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_number_column='bg0'
colorscheme gruvbox

""" set relative line number
set number relativenumber

""" space key as leader
let mapleader = " "

""" Clipboard
set clipboard+=unnamedplus

""" Searching with /
set ignorecase
set smartcase
set nohlsearch  " Disable hlsearch

""" Key, keycode delay
set timeoutlen=1000 ttimeoutlen=0

""" map Y to have same behavior as C and D
map Y y$

""" remap J, K to move up and down
map J <C-d>
map K <C-u>

""" map :W to :w
command W w

""" map Enter to new line
nmap <cr> o<esc>

""" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Indentation 
set tabstop=8 softtabstop=0 expandtab shiftwidth=4

""" No wrap long line
set nowrap

""" enable all Python syntax highlighting features
let python_highlight_all = 1

""" disable Ex mode
map Q <Nop>

""" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" nerdtree
" toggle
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" bookmark file
let NERDTreeBookmarksFile = '~/.local/share/nvim' . '/NERDTreeBookmarks'

""" easymotion 
map <Leader> <Plug>(easymotion-prefix)

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
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" goto code navigations
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc search
nmap <leader>rs :CocSearch -S 

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show documentation in preview window.
nnoremap <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Code format
nmap <F7> :call CocAction('format')<CR>

""" cmd line
" hide actual tabline
set showtabline=0

" Set ruler to show current buffer
highlight User1 ctermfg=9
set ruler
set rulerformat=%80(%1*%.3n\ %f\%=%l,%(%c%V%)\ %P%)%*

""" fzf
nnoremap <Leader>gf :Files<CR>
nnoremap <Leader>gb :Buffers<CR>
nnoremap <Leader>gl :Lines<CR>

""" buffers switching: Ngb
let c = 1
while c <= 30
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
endwhile

""" Set default cursorline, toggle cursorline
set cursorline
nnoremap <Leader>hi :set cursorline!<CR>
