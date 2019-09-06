" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
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
 "Ack plugin for fast search
 Plug 'mileszs/ack.vim'

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
"Disabled as conflict with coc nvim tab / cr bind and dont seem to use this?
"Plug 'tpope/vim-endwise'

"Close brackets etc when you press enter
"Plug 'rstacruz/vim-closer'
Plug 'junegunn/goyo.vim'
"Autoclose - disabling because its being weird..
"Plug 'jiangmiao/auto-pairs'
"Plug 'Raimondi/delimitMate'
"Tmux window navigation vim style, allows you to use the same keybinds to
"switch tmux panes, even when in vim. Aware of vim splits to 
Plug 'christoomey/vim-tmux-navigator'
"Run tmux commands from inside vim
"" Run last command executed by VimuxRunCommand
"map <Leader>vl :VimuxRunLastCommand<CR>"
Plug 'benmills/vimux'

"COde runner
Plug '0x84/vim-coderunner'

"Vimwiki
Plug 'vimwiki/vimwiki'
"Taskwiki
Plug 'tbabej/taskwiki'

"coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Complete tmux things on screen from vim
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'wellle/tmux-complete.vim'

"AI machine learning completion??
"Plug 'zxqfl/tabnine-vim'
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
"Can use Ctrl+V to open in a vertical split, CTRL+T new tab, CTRL +X new
"horizontal split
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

"Mouse enable, a option seems to cause issues with copy paste. Trying r
set mouse=r

"Persistent Undo
"Make sure you create undodir! Otherwise no work!
set undofile
set undodir=~/.undodir
"Undo plugin bind
nnoremap <F5> :UndotreeToggle<cr>


" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

"hide so can switch buffer without writing for fzf etc
set hidden
set clipboard=unnamedplus

"Coc.vim settings:
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
   \ pumvisible() ? "\<C-n>" :
   \ <SID>check_back_space() ? "\<TAB>" :
   \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
 execute 'h '.expand('<cword>')
else
 call CocAction('doHover')
endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
autocmd!
" Setup formatexpr specified filetype(s).
autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
" Update signature help on jump placeholder
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Conflict endwise with coc.nvim enter completion making pumvisible appear..
" let g:endwise_no_mappings=1
