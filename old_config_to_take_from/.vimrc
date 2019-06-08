let g:mapleader = "\<Space>"
call plug#begin('~/.vim/plugged')
" Initialize plugin system
"Plug  'ctrlpvim/ctrlp.vim'
"C# Unity stuff
Plug 'OmniSharp/omnisharp-vim'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
call plug#end()
colorscheme molokai_dark
syntax on
filetype plugin indent on
set ignorecase
set smartcase
:set number relativenumber
map <Leader> <Plug>(easymotion-prefix)
map <C-e> :NERDTreeToggle<CR>

nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
"Spotify
nnoremap <silent> <leader><space>n :SpNext<CR>
nnoremap <silent> <leader><space>b :SpPrevious<CR>:SpPrevious<CR>
nnoremap <silent> <leader><space>/ :SpSearch 

"Ag (ack.vim) Silver surfer setup
if executable('ag')
    let g:ackprg = 'ag --vimgrep -Q'
endif

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

"Mouse enable
set mouse=a

"Persistent Undo
set undofile
set undodir=~/.undodir
"Undo plugin bind
nnoremap <F5> :UndotreeToggle<cr>

