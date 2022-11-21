export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER="andylithia"
echo "\e[0m\e[30m\e[40m\e[1;34m ZSH Context: $USER@$HOST \e[0m\e[30m\e[0m"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

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

plugins=(
	git
	zsh-autosuggestions
	k
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

function acp() {
  git add .
  git commit -m "$1"
  git push
}

export PICO_SDK_PATH="/home/andylithia/pico/pico-sdk"
# xschem
export PATH="$PATH:/home/andylithia/xschem/bin"
export USER_CONF_DIR="/home/andylithia/.xschem"
# magic
export CAD_ROOT="/usr/local/lib"

export GCM_CREDENTIAL_STORE="gpg"
export PATH="$PATH:/home/andylithia/ngspice/bin"

# CURRENT PROJECT: 41CA
#export PDK_ROOT="/home/andylithia/openmpw/pdk"
# export WDR="/home/andylithia/openmpw/project_kyouko"
export PDK_ROOT="/home/andylithia/openmpw/pdk_1"
export PDKPATH="$PDK_ROOT/sky130B"
export OPENLANE_ROOT="/home/andylithia/openmpw/OpenLane"
export WDR="/home/andylithia/openmpw/Project-Reisen-Chip1"
export UPRJ_ROOT="$WDR"
export INPUT_DIRECTORY="$WDR"
export CARAVEL_ROOT="$WDR/caravel"
export MCW_ROOT="$WDR/caravel/mgmt_core_wrapper"
export GCC_PATH="/home/andylithia/openmpw/RV32I_GCC/bin"
export PATH="$GCC_PATH:/home/andylithia/.local/bin:$PATH"
# golang-1.16
export GOROOT="/usr/local/go"
export GOPATH="/home/andylithia/go"
export PATH="$GOPATH/bin:$GOROOT/bin:$PATH" 

# XC8 Compiler
export PATH="/opt/microchip/xc8/v2.36/pic-as/bin:opt/microchip/xc8/v2.36/bin:$PATH"

# AWS S3
export AWS_ACCESS_KEY_ID="AKIAXDMEXUIZUYJ5EMF5"
export AWS_SECRET_ACCESS_KEY="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"

export QSYS_ROOTDIR="/home/andylithia/intelFPGA_lite/22.1std/quartus/sopc_builder/bin"
