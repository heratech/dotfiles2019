# If you come from bash you might have to change your $PATH.
export GOPATH="/Users/junaidbaldick/workspace"
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/Users/junaidbaldick/workspace/bin:/usr/local/bin:~/Library/Python/2.7/bin:~/.composer/vendor/bin/
export PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"

# Path to your oh-my-zsh installation.
 export ZSH="$HOME/.oh-my-zsh"
 export EDITOR="nvim"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl minikube vi-mode z artisan composer alias-tips tmux fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

# After the "source Oh My Zsh" line
# plugins=(git kubectl minikube vi-mode z artisan composer alias-tips kube-ps1 tmux fancy-ctrl-z)
# PROMPT=$PROMPT'$(kube_ps1) '

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias t="task"
alias a="artisan"
alias tinker="artisan tinker"
alias serve="artisan serve"
alias te="vendor/phpunit/phpunit/phpunit"
alias te="vendor/phpunit/phpunit/phpunit"
alias phpunit="vendor/bin/phpunit"
alias preview='fzf --preview '\''bat --color "always" {}'\'
alias ctags="`brew --prefix`/bin/ctags"
alias vim="nvim"
eval $(thefuck --alias)
alias damn="fuck"
alias diff="diff-so-fancy"
alias cat="bat"
alias k="kubectl"

# I usually use this command instead
alias l="exa -lahF"

alias find="fd"

alias fixit="~/code/fix-my-code.sh"

ARTISAN_OPEN_ON_MAKE_EDITOR=pstorm 

# export _Z_CMD="j"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

function sshJustPark() {
    podName=$(kubectl get pods | grep '^\justpark' | grep -v 'justpark-web' | grep -o '^[^ ]*');
    if [ "$podName" = '' ]; then
        echo "Pod not running";
    else
        echo "SSHing to $podName";
        kubectl exec -it ${podName} -c php-dev -- /bin/bash;
    fi
}

function logJustPark() {
    podName=$(kubectl get pods | grep '^\justpark' | grep -v 'justpark-web' | grep -o '^[^ ]*');
    if [ "$podName" = '' ]; then
        echo "Pod not running";
    else
        echo "Logging from $podName";
        kubectl logs -f ${podName} -c php-dev
    fi
}

alias sjp='sshJustPark'
alias slp='logJustPark'
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_password


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/junaidbaldick/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/junaidbaldick/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/junaidbaldick/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/junaidbaldick/google-cloud-sdk/completion.zsh.inc'; fi

export KUBECTL_FZF_OPTIONS=(-1 --header-lines=2 --layout reverse -e --no-hscroll --no-sort --bind space:accept)
source <(kubectl completion zsh)
source ~/.kubectl_fzf.plugin.zsh

zstyle ':completion:*' matcher-list 'r:|=*'

unalias z 2> /dev/null
function z() {
  if [[ -z "$*" ]]; then
    cd "$(_z -l 2>&1 | fzf +s --tac | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    _z "$@"
  fi
}

function zz() {
  cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q "$_last_z_args")"
}


alias j=z
alias jj=zz

# c - browse chrome history
function c() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

alias b="~/code/b.rb"

# fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
function fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco_preview - checkout git branch/tag, with a preview showing the commits between the tag/branch and HEAD
function fco_preview() {
  local tags branches target
  branches=$(
    git --no-pager branch --all \
      --format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
    | sed '/^$/d') || return
  tags=$(
    git --no-pager tag | awk '{print "\x1b[35;1mtag\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches"; echo "$tags") |
    fzf --no-hscroll --no-multi -n 2 \
        --ansi --preview="git --no-pager log -150 --pretty=format:%s '..{2}'") || return
  git checkout $(awk '{print $2}' <<<"$target" )
}


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
