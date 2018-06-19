# The following lines were added by compinstall
zstyle :compinstall filename '/home/aronwk/.zshrc'

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# auto completetion
autoload -Uz compinit
compinit
zstyle ':completion:*' rehash true
# completeion with arrow key driven interface
zstyle ':completion:*' menu select
# completion for aliases
setopt COMPLETE_ALIASES

# Meta Key fix
unsetopt MULTIBYTE

# Key Bindings
source ~/.zkbd/xterm-termite-:0

# plugins
plugins=(
  git
  colorize 
  bundler
  man
)

# colored manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Window title
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;[%n@%M]\a"
    } 
    preexec () { print -Pn "\e]0;[%n@%M]($1)\a" }
    ;;
  screen|screen-256color)
    precmd () { 
      vcs_info
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]\a" 
    }
    preexec () { 
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]($1)\a" 
    }
    ;; 
esac

# Path
typeset -U path
path=(~/.local/bin $path[@])

# Auto Suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highliting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Exports
export BROWSER="chromium"
export EDITOR='/usr/bin/code'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# Dir colors
LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
export LS_COLORS

# Aliases
source  ~/.aliases

# Powerlevel 9K theme
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir newline pyenv virtualenv nodeenv rbenv vcs) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status dir_writable root_indicator background_jobs) 
POWERLEVEL9K_SHORTEN_DIR_LENGTH='2' 
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱" 
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳ " 
POWERLEVEL9K_DIR_SHOW_WRITABLE="true" 
