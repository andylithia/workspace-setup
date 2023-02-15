export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER="andylithia"
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

echo "\e[0m\e[30m\e[40m\e[1;34m ZSH Context: $USER@$HOST \e[0m\e[30m\e[0m"
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

# -- Pico
export PICO_SDK_PATH="/home/andylithia/pico/pico-sdk"

# -- git Credentials
export GCM_CREDENTIAL_STORE="gpg"
export PATH="$PATH:/home/andylithia/ngspice/bin"

# -- PIP
export PATH="$PATH:/home/andylithia/.local/bin"

# -- OpenMPW Project Selector
# 
mpw_registertools()
{
	# -- xschem
	# export PATH="$PATH:/home/andylithia/xschem/bin"
	export USER_CONF_DIR="/home/andylithia/.xschem"
	# -- magic
	export CAD_ROOT="/usr/local/lib"

	# -- Caravel
	# export PDKPATH="$PDK_ROOT/sky130B"
	# export OPENLANE_ROOT="/home/andylithia/openmpw/OpenLane"
	# export UPRJ_ROOT="$WDR"
	# export INPUT_DIRECTORY="$WDR"
	# export CARAVEL_ROOT="$WDR/caravel"
	# export MCW_ROOT="$WDR/caravel/mgmt_core_wrapper"
}

echo "Select workspace:"
echo "Y). Sky130A  - Project-Yatsuhashi"
echo "R). Sky130A  - Project-Reisen     << Default"
echo "G). GF180mcu - Project-Futo"
echo "S). GF180mcu - Project-Shizuha"
echo "N). none"
read answer
case ${answer:0:1} in
	[Yy]* )
		echo "Selecting Project-Yatsuhashi"
		export PROJ_NAME="Yatsuhashi"
		export PDK_ROOT="/home/andylithia/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/sky130A"
		export WDR="/home/andylithia/openmpw/Project-Yatsuhashi-Chip1"
		mpw_registertools
	;;
	[Gg]* )
		echo "Selecting Project-Futo"
		export PROJ_NAME="Futo"
		export PDK_ROOT="/home/andylithia/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/gf180mcuC"
		export WDR="/home/andylithia/openmpw/Project-Futo-Chip1"
		export KLAYOUT_PATH="$PDK_ROOT/gf180mcuC/libs.tech/klayout"
		mpw_registertools
	;;
	[Ss]* )
		echo "Selecting Project-Shizuha"
		export PROJ_NAME="Shizuha"
		export PDK_ROOT="/home/andylithia/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/gf180mcuC"
		export WDR="/home/andylithia/openmpw/Project-Shizuha"
		export KLAYOUT_PATH="$PDK_ROOT/gf180mcuC/libs.tech/klayout"
		mpw_registertools
	;;
	[Nn]* )
        echo "None"
    ;;
	* )
        echo "Selecting Project-Reisen"
		export PROJ_NAME="Reisen"
		export PDK_ROOT="/home/andylithia/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/sky130A"
		export WDR="/home/andylithia/openmpw/Project-Reisen-Chip1"
		export KLAYOUT_PATH="$PDK_ROOT/sky130A/libs.tech/klayout"
		mpw_registertools
	;;

esac

# -- Adding RV32I GCC
# export GCC_PATH="/home/andylithia/openmpw/RV32I_GCC/bin"
# export PATH="$GCC_PATH:/home/andylithia/.local/bin:$PATH"
# -- golang-1.16
# export GOROOT="/usr/local/go"
# export GOPATH="/home/andylithia/go"
# export PATH="$GOPATH/bin:$GOROOT/bin:$PATH" 
# -- XC8 Compiler
# export PATH="/opt/microchip/xc8/v2.36/pic-as/bin:opt/microchip/xc8/v2.36/bin:$PATH"

source ~/.ssh/AWS.key

# -- Quartus
export QSYS_ROOTDIR="/home/andylithia/intelFPGA_lite/22.1std/quartus/sopc_builder/bin"
