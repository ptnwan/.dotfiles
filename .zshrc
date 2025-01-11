# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi




# -------------------- Zinit --------------------

# Zinit and plugins directories
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit if it's not existed
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions




# -------------------- Completion --------------------

# Load completions
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"




# -------------------- Keybindings --------------------

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward




# -------------------- History --------------------

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups




# -------------------- Path --------------------

# Path
setopt extended_glob null_glob

path=(
    $path
    /opt/nvim-linux64/bin
)

typeset -U path
path=($^path(N-/))

export PATH




# -------------------- Environment variables --------------------

export EDITOR=nvim




# -------------------- Aliases --------------------

# Neovim
alias vi=nvim

# ls
alias ls='ls --color'
alias la='ls -a --color'
alias lh='ls -lh --color'
alias lha='ls -lath --color'

alias start-sshd='eval "$(ssh-agent -s)"'




# -------------------- Powerlevel10k --------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
