" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" On-demand loading
Plug 'scrooloose/nerdtree'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Agraw etc
Plug 'jesseleite/vim-agriculture'

" Plug 'Shougo/denite.nvim'
" Track the engine.
Plug 'SirVer/ultisnips'
" Phpdoc generation
Plug 'tobyS/vmustache'
Plug 'tobyS/pdv'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

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
"Git stuff!
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" Git viewer :GV
Plug 'junegunn/gv.vim'
"Git gutter
Plug 'airblade/vim-gitgutter'
"Markdown
Plug 'tpope/vim-markdown'
"Go plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Nice commenting / uncommenting of code
Plug 'tpope/vim-commentary'
"Comment stuff out. Use gcc to comment out a line (takes a count), gc to comment out the target of a motion (for example, gcap to comment out a paragraph), gc in visual mode to comment out the selection, and gc in operator pending mode to target a comment. You can also use it as a command, either with a range like :7,17Commentary, or as part of a :global invocation like with :g/TODO/Commentary. That's it.
"Lightline
 Plug 'itchyny/lightline.vim'
 Plug 'mengelbrecht/lightline-bufferline'
 "Ack plugin for fast search
 Plug 'mileszs/ack.vim'
 "RG plugin
 " Plug 'jremmen/vim-ripgrep'

 "Color schemes
 Plug 'flazz/vim-colorschemes'

 "
 Plug 'majutsushi/tagbar'

 "Undo tree - bound to F5 later
 Plug 'mbbill/undotree'
 "Coc vim
 " Plug 'neoclide/coc.nvim', {'branch': 'release'}
 "Gutentags
 
 " Plug 'ludovicchabant/vim-gutentags'




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
" Plug 'vimwiki/vimwiki'
"Taskwiki
" Plug 'tbabej/taskwiki'

"vim-unit testing
Plug 'janko/vim-test'

"EditorConfig
Plug 'editorconfig/editorconfig-vim'

Plug 'arnaud-lb/vim-php-namespace'
" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'phpactor/ncm2-phpactor'

"Php Actor php autocompletion better
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}

"coc.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Minimap
Plug 'severin-lemaignan/vim-minimap'
"Auto import clases etc
Plug 'arnaud-lb/vim-php-namespace'
Plug 'vim-vdebug/vdebug'


"zoom windows like tmux
Plug 'dhruvasagar/vim-zoom'
"Complete tmux things on screen from vim
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'wellle/tmux-complete.vim'

"AI machine learning completion??
"Plug 'zxqfl/tabnine-vim'

" Git blame status bar
Plug 'zivyangll/git-blame.vim'


"Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

"Ansible vault and base64
":AnsibleVaultEncrypt
":AnsibleVaultDecrypt
Plug 'b4b4r07/vim-ansible-vault'
"In a Visual Selection (v)
"After replacement, the new text will automatically be visually selected.

"<leader>atob to convert from base64 to a string
"<leader>btoa to convert from a string to base64
" Plug 'christianrondeau/vim-base64'

"Quick switch projects
Plug 'arkwright/vim-whiplash'

"GitGrep
Plug 'aghareza/vim-gitgrep'

"Current function in status line
Plug 'tyru/current-func-info.vim'
Plug 'liuchengxu/vista.vim'

"Dash app on osx. lookup api with :Dash
Plug 'rizzatti/dash.vim'

Plug 'ap/vim-buftabline'

"SudoWrite etc
Plug 'tpope/vim-eunuch'

"Multicursor
"Plug 'terryma/vim-multiple-cursors'

" Initialize plugin system
call plug#end()
