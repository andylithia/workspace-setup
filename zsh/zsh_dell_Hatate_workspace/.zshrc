export ZSH="$HOME/.oh-my-zsh"
export DEFAULT_USER="andylithia"
ZSH_THEME="agnoster"
COMPLETION_WAITING_DOTS="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

plugins=(
	git
	gitignore
	vscode
	zsh-autosuggestions
	# zsh-syntax-highlighting
	k
)

source $ZSH/oh-my-zsh.sh

echo "\e[0m\e[30m\e[40m\e[1;34m ZSH Context: $USER@$HOST \e[0m\e[30m\e[0m"

# export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='gvim'
fi

# -- Credentials
export GCM_CREDENTIAL_STORE="gpg"
source ~/.ssh/AWS.key
# -- PIP
export PATH="$PATH:/home/$DEFAULT_USER/.local/bin"

# -- RISC-V Project Selector
rv_menu(){
	conda activate vdv
	export PATH="/home/$DEFAULT_USER/opt/riscv/bin:$PATH"
	export VERILATOR_ROOT="/home/$DEFAULT_USER/dv/verilator/"
}
alias d2x='xrandr --output eDP-1 --scale 0.5x0.5 --filter nearest'
alias d1x='xrandr --output eDP-1 --scale 1x1'
#d2x(){
#	gsettings set org.gnome.desktop.interface scaling-factor 1
#	gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <1>}"
#	xrandr --output eDP-1 --scale 0.5x0.5 --filter nearest
#}
#
#d1x(){
#	gsettings set org.gnome.desktop.interface scaling-factor 2
#	gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gdk/WindowScalingFactor': <2>}"
#	xrandr --output eDP-1 --scale 1x1
#}

# -- OpenMPW Project Selector
#
mpw_menu(){
mpw_registertools() {
	conda activate mpw
	export USER_CONF_DIR="/home/$DEFAULT_USER/.xschem"
	# -- magic
	export CAD_ROOT="/usr/local/lib"
	# -- Caravel
	# export PDKPATH="$PDK_ROOT/sky130B"
	# export OPENLANE_ROOT="/home/andylithia/openmpw/OpenLane"
	# export UPRJ_ROOT="$WDR"
	# export INPUT_DIRECTORY="$WDR"
	export CARAVEL_ROOT="$WDR/caravel"
	# export MCW_ROOT="$WDR/caravel/mgmt_core_wrapper"
}

echo "Select workspace:"
echo "Y). Sky130A  - Project-Yatsuhashi"
echo "O). Sky130A  - Project-Nanofab"
echo "R). Sky130A  - Project-Reisen"
echo "G). GF180mcu - Project-Futo"
echo "G). GF180mcu - Project-Hatate     << Default"
echo "S). GF180mcu - Project-Shizuha"
echo "N). none"
read answer
case ${answer:0:1} in
	[Yy]* )
		echo "Selecting Project-Yatsuhashi"
		export PROJ_NAME="Yatsuhashi"
		export PDK_ROOT="/home/$DEFAULT_USER/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/sky130A"
		export WDR="/home/$DEFAULT_USER/openmpw/Project-Yatsuhashi-Chip1"
		mpw_registertools
	;;
	[Oo]* )
		echo "Selecting Project-Nanofab"
		export PROJ_NAME="Nanofab"
		export PDK_ROOT="/home/$DEFAULT_USER/openmpw/pdk_1"
		export PDK="sky130A"
		export PDKPATH="$PDK_ROOT/$PDK"
		export WDR="/home/$DEFAULT_USER/openmpw/Project-Nanofab"
		mpw_registertools
	;;
	[Gg]* )
		echo "Selecting Project-Futo"
		export PROJ_NAME="Futo"
		export PDK_ROOT="/home/$DEFAULT_USER/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/gf180mcuC"
		export WDR="/home/$DEFAULT_USER/openmpw/Project-Futo-Chip1"
		export KLAYOUT_PATH="$PDK_ROOT/gf180mcuC/libs.tech/klayout"
		mpw_registertools
	;;
	* )
		echo "Selecting Project-Hatate"
		export PROJ_NAME="Hatate"
		export PDK_ROOT="/home/$DEFAULT_USER/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/gf180mcuC"
		export WDR="/home/$DEFAULT_USER/openmpw/Hatate"
		export KLAYOUT_PATH="$PDK_ROOT/gf180mcuC/libs.tech/klayout"
		mpw_registertools
	;;
	[Ss]* )
		echo "Selecting Project-Shizuha"
		export PROJ_NAME="Shizuha"
		export PDK_ROOT="/home/$DEFAULT_USER/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/gf180mcuC"
		export WDR="/home/$DEFAULT_USER/openmpw/Project-Shizuha"
		export KLAYOUT_PATH="$PDK_ROOT/gf180mcuC/libs.tech/klayout"
		mpw_registertools
	;;
	[Nn]* )
        echo "None"
    ;;
	[Rr]* )
        echo "Selecting Project-Reisen"
		export PROJ_NAME="Reisen"
		export PDK_ROOT="/home/$DEFAULT_USER/openmpw/pdk_1"
		export PDKPATH="$PDK_ROOT/sky130A"
		export WDR="/home/$DEFAULT_USER/openmpw/Project-Reisen-Chip1"
		export KLAYOUT_PATH="$PDK_ROOT/sky130A/libs.tech/klayout"
		mpw_registertools
	;;
esac
}

# -- Verilator
# export VERILATOR_ROOT="/usr/local"
# export PATH="$VERILATOR_ROOT/bin:$PATH"


# -- Pico
export PICO_SDK_PATH="/home/$DEFAULT_USER/pico/pico-sdk"
# -- Quartus
export QSYS_ROOTDIR="/home/$DEFAULT_USER/intelFPGA_lite/22.1std/quartus/sopc_builder/bin"
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andylithia/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andylithia/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andylithia/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andylithia/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/andylithia/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/andylithia/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/andylithia/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/andylithia/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
