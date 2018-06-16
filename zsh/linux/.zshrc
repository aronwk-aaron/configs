# The following lines were added by compinstall
zstyle :compinstall filename '/home/aronwk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

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

# Path
typeset -U path
path=(~/.local/bin $path[@])

# auto completetion
autoload -Uz compinit
compinit
# completeion with arrow key driven interface
zstyle ':completion:*' menu select
# completion for aliases
setopt COMPLETE_ALIASES

# Auto Suggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highliting
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Exports
export EDITOR='/usr/bin/code'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

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
