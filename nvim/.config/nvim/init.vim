scriptencoding utf-8
source ~/.config/nvim/plugins.vim

"Change leader key to Space
let mapleader="\<Space>"

"General Settings
set termguicolors
" colorscheme molokai
" colorscheme dracula
colorscheme basic-dark
syntax on
filetype plugin indent on
set ignorecase
set smartcase
set number relativenumber
"Quick edit vimrc and quick source vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
"FZF Keybinds
"Can use Ctrl+V to open in a vertical split, CTRL+T new tab, CTRL +X new
"horizontal split
"nnoremap <Leader>o :Files<CR>
nnoremap <silent> <leader>t :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> ; :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>g :GF?<CR>

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

"Nerdtree binds
map <C-e> :NERDTreeToggle<CR>
" map <C-t> :TagbarToggle <CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

"Close vim if nerdtree last window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" == END NERDTree ==

" enable ncm2 for all buffer3
" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
" set completeopt=noinsert,menuone,noselect
"

"Unknown
" map <Leader> <Plug>(easymotion-prefix)


"Spotify
" nnoremap <silent> <leader><space>n :SpNext<CR>
" nnoremap <silent> <leader><space>b :SpPrevious<CR>:SpPrevious<CR>
" nnoremap <silent> <leader><space>/ :SpSearch 

"Ag (ack.vim) Silver surfer setup
"Its a cool search thing for files - opens in quick fix window
" Commented out below to switch to rg
" if executable('ag')
"     let g:ackprg = 'ag --vimgrep -Q'
" endif

if executable('rg')
    let g:ackprg = 'rg --vimgrep --no-heading -F'
endif 

" I prefer fzf interface to quickfix /ack window
"cnoreabbrev Ack Ack!
"nnoremap <Leader>a :Ack!<Space>
command! -bang -nargs=* Rgnew
      \ call fzf#vim#grep(
      \   'rg -fixed-strings --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

nnoremap <Leader>z :Rgnew

" " autocmd VimEnter * noremap <Leader>a  :Rg<Space>
" let g:rg_command = 'rg --vimgrep -S -F'


nnoremap <Leader>a :Rg<Space>
nmap <Leader>/ <Plug>RgRawSearch
vmap <Leader>/ <Plug>RgRawVisualSelection
nmap <Leader>* <Plug>RgRawWordUnderCursor

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


"Unit testing
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

let test#strategy = {
  \ 'nearest': 'vimux',
  \ 'file':    'vimux',
  \ 'suite':   'vimux',
\}

""Coc nvim

""Auto import function caret is on
"function! IPhpInsertUse()
"    call PhpInsertUse()
"    call feedkeys('a',  'n')
"endfunction
"autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
"autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

""Coc.vim settings:
"" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

"" Better display for messages
set cmdheight=2

"" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"" don't give |ins-completion-menu| messages.
set shortmess+=c

"" always show signcolumns
set signcolumn=yes

"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
   \ pumvisible() ? "\<C-n>" :
   \ <SID>check_back_space() ? "\<TAB>" :
   \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
"" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
 execute 'h '.expand('<cword>')
else
 call CocAction('doHover')
endif
endfunction

"" Highlight symbol under cursor on CursorHold
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Remap for rename current word
"nmap <leader>rn <Plug>(coc-rename)

"" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
"autocmd!
"" Setup formatexpr specified filetype(s).
"autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"" Update signature help on jump placeholder
"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap for do codeAction of current line
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Fix autofix problem of current line
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

"" Use `:Format` to format current buffer
"command! -nargs=0 Format :call CocAction('format')

"" Use `:Fold` to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" use `:OR` for organize import of current buffer
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Using CocList
"" Show all diagnostics
nnoremap <silent> <space><space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Conflict endwise with coc.nvim enter completion making pumvisible appear..
" let g:endwise_no_mappings=1
"
"
let g:ncm2_phpactor_timeout = 20
let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js']
"let g:tagbar_phpctags_bin='~/.vim/phpctags'

nmap <F8> :TagbarToggle<CR>

" ==== lightline settings ====
" let g:lightline = {
"     \ 'tabline' : {
"     \   'left': [['buffers']], 'right': [['close']]
"     \ },
"     \ 'active': {
"     \   'left': [['mode'], ['readonly', 'filename', 'modified'], ['tagbar', 'gutentags']],
"     \   'right': [['lineinfo'], ['filetype']]
"     \ },
"     \ 'inactive': {
"     \   'left': [['absolutepath']],
"     \   'right': [['lineinfo'], ['filetype']]
"     \ },
"     \ 'component': {
"     \   'lineinfo': '%l\%L [%p%%], %c, %n',
"     \   'tagbar': '%{tagbar#currenttag("[%s]", "", "f")}',
"     \   'gutentags': '%{gutentags#statusline("[Generating...]")}',
"     \ },
"     \ }
" " ==== End lightline settings ====

let g:tagbar_autofocus = 1

set showtabline=2

" let g:lightline#bufferline#show_number  = 1
" let g:lightline#bufferline#shorten_path = 0
" let g:lightline#bufferline#unnamed      = '[No Name]'
" let g:lightline#bufferline#filename_modifier = ':t'


" let g:lightline                  = {}
" let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
" let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
" let g:lightline.component_type   = {'buffers': 'tabsel'}
" let g:lightline.active           = {'left': [ ['mode', 'paste'],['readonly', 'filename']]}

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'gitbranch', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'method': 'NearestMethodOrFunction',
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'fugitive#head',
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
" Insert use class thing 
" autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

set tags+=tags,tags.vendors,tags.tests

let g:vdebug_options = {
      \  'path_maps': {
      \'/app': '/Users/junaidbaldick/code/justpark'
      \}
\}

"Make completion more like ides
"https://vim.fandom.com/wiki/Improve_completion_popup_menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : exists("g:loaded_snips") ? "\<C-r>=TriggerSnippet()\<CR>" : "\<Tab>"
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)
"nmap s <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)



" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"-F means don't have to escape but lose regex.. 
let $FZF_DEFAULT_COMMAND = 'rg -F --files --hidden --follow --glob "!.git/*" --glob "!tags" --ignore --ignore-file "~/.ignore"'

"Update git gitter on buffer save
autocmd BufWritePost * GitGutter

"fix  coc.vim and git gutter  can't  both have  gutter sign
set signcolumn=auto:2

" PHP Find Implementations
function! PhpImplementations(word)
    exe 'Ack "implements.*' . a:word . ' *($|{)"'
endfunction

" PHP Find Subclasses
function! PhpSubclasses(word)
    exe 'Ack "extends.*' . a:word . ' *($|{)"'
endfunction

noremap <Leader>fi :call PhpImplementations('<cword>')<CR>
noremap <Leader>fe :call PhpSubclasses('<cword>')<CR>

" PHP Find Usage
function! PhpUsage(word)
    exe 'Ack "::' . a:word . '\(|>' . a:word . '\("'
endfunction

noremap <Leader>fu :call PhpUsage('<cword>')<CR>
nnoremap <Leader>G :<C-u>call gitblame#echo()<CR>

map <C-n> :cn<CR>
map <C-p> :cp<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"PHPDOC gen
let g:pdv_template_dir = $HOME ."/templates_snip"
nnoremap <Leader>pd :call pdv#DocumentWithSnip()<CR>
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Show full path to file always
" set statusline+=%F

" If get stuck in fzf
"tnoremap <Esc> <C-\><C-n>:q!<CR>

nnoremap <C-g>f :echo cfi#format("%s", "")<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
