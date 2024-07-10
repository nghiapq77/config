""" Plugin manager
call plug#begin(stdpath('data') . '/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-surround'
    Plug 'easymotion/vim-easymotion'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

""" theme
set termguicolors
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_number_column='bg0'
colorscheme gruvbox

""" setting
set number relativenumber
set clipboard+=unnamedplus
set nowrap
set nohlsearch
set mouse=a

" Searching with /
set ignorecase
set smartcase

" Key, keycode delay
set timeoutlen=1000 ttimeoutlen=0

" Indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=4

" Set default cursorline, toggle cursorline
set cursorline

" Disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable all Python syntax highlighting features
"let python_highlight_all = 1

""" remapping
" space as leader
let mapleader = " "

" map Y to have same behavior as C and D
map Y y$

" remap J, K to move up and down
map J <C-d>zz
map K <C-u>zz
"nnoremap J <C-d>zz
"nnoremap K <C-u>zz
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map :W to sudo write
command W w !sudo tee %

" map Enter to new line
nmap <cr> o<esc>

" cycling through listed buffers
nnoremap <leader>j :bnext<CR>
nnoremap <leader>k :bprevious<CR>

" alternate file
nnoremap <leader><tab> <C-^>

" disable Ex mode
map Q <Nop>

""" nerdtree
" toggle
map <C-n> :NERDTreeToggle<CR>

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" bookmark file
let NERDTreeBookmarksFile = '~/.local/share/nvim' . '/NERDTreeBookmarks'

""" easymotion 
map <Leader><Leader> <Plug>(easymotion-prefix)

""" CoC
" TextEdit might fail if hidden is not set.
set hidden

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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

" hide statusline
set laststatus=0

" Set ruler to show current buffer
highlight User1 ctermfg=9
set ruler
set rulerformat=%80(%1*%.3n\ %f\%=%l,%(%c%V%)\ %P%)%*

""" fzf
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>l :Lines<CR>
nnoremap <Leader>s :Rg<CR>
nnoremap <Leader>b :Buffers<CR>

"""treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
