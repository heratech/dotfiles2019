" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Startup screen for vim/dashboard recent files
Plug 'mhinz/vim-startify'

"Session management
Plug 'tpope/vim-obsession'
"Sensible defaults
Plug 'tpope/vim-sensible'
"Vim Surround - e.g cs"' to change double quotes to single quotes
Plug 'tpope/vim-surround'
"Set tablines etc based on file - expand tabe and shiftwidth
Plug 'tpope/vim-sleuth'

"Nice commenting / uncommenting of code
Plug 'tpope/vim-commentary'
"Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.
"Lightline
 Plug 'itchyny/lightline.vim'

 "Color schemes
 Plug 'flazz/vim-colorschemes'

 "Undo tree - bound to F5 later
 Plug 'mbbill/undotree'

"Easy motion - keys such as w and f to move around
Plug 'easymotion/vim-easymotion'
"I don't think I need sneak with easy motion?

"Tmux navigation - move between tmux windows and vim windows with same binds
Plug 'christoomey/vim-tmux-navigator'

"Tpope endwise. Addds end if after if etc
Plug 'tpope/vim-endwise'

"Close brackets etc when you press enter
Plug 'rstacruz/vim-closer'

"Autoclose
Plug 'jiangmiao/auto-pairs'
"Plug 'Raimondi/delimitMate'


" Initialize plugin system
call plug#end()

"Remember to call :PlugInstall to install the plugins..
"General Settings
colorscheme molokai_dark
syntax on
filetype plugin indent on
set ignorecase
set smartcase
set number relativenumber
"Change leader key to Space
let mapleader="\<Space>"
"Quick edit vimrc and quick source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"FZF Keybinds
"nnoremap <Leader>o :Files<CR>
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
"Nerdtree binds
map <C-e> :NERDTreeToggle<CR>

"Close vim if nerdtree last window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"

"Unknown
"map <Leader> <Plug>(easymotion-prefix)


"Spotify
" nnoremap <silent> <leader><space>n :SpNext<CR>
" nnoremap <silent> <leader><space>b :SpPrevious<CR>:SpPrevious<CR>
" nnoremap <silent> <leader><space>/ :SpSearch 

"Ag (ack.vim) Silver surfer setup
"Its a cool search thing for files - opens in quick fix window
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

