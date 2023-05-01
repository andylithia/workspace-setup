# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER="andylithia"
ZSH_THEME="agnoster"
zstyle ':omz:update' mode auto      # update automatically without asking
COMPLETION_WAITING_DOTS="true"
plugins=(
	git
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

echo "\e[0m\e[30m\e[40m\e[1;34m ZSH Context: $USER@$HOST \e[0m\e[30m\e[0m"
# export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
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
alias vim="nvim"

# Created by `pipx` on 2023-03-08 20:53:08
export PATH="$PATH:/Users/andylithia/.local/bin"
# Adding vscode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Adding Emacs
export PATH="$PATH:/Applications/Emacs.app/Contents/MacOS"
# Adding GNU
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

rv_workspace() {
	# export PATH="/Users/andylithia/RV/toolchain/bin:$PATH"
}
