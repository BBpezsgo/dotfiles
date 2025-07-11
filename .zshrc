# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias ls='ls --hyperlink=auto --color=auto'
alias grep='grep --color=auto'
alias icat="kitten icat"
alias shimnei='/home/BB/Shimnei/linux-shimeji/launch.sh'

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export LS_COLORS='rs=0:di=00;35:ln=04;35:mh=00:pi=45;30:so=45;30:do=45;30:bd=40;33;01:cd=40;33;01:or=00:mi=00:su=00:sg=00:ca=00:tw=0:ow=0:st=0:ex=00;34:*.7z=00;31:*.ace=00;31:*.alz=00;31:*.apk=00;31:*.arc=00;31:*.arj=00;31:*.bz=00;31:*.bz2=00;31:*.cab=00;31:*.cpio=00;31:*.crate=00;31:*.deb=00;31:*.drpm=00;31:*.dwm=00;31:*.dz=00;31:*.ear=00;31:*.egg=00;31:*.esd=00;31:*.gz=00;31:*.jar=00;31:*.lha=00;31:*.lrz=00;31:*.lz=00;31:*.lz4=00;31:*.lzh=00;31:*.lzma=00;31:*.lzo=00;31:*.pyz=00;31:*.rar=00;31:*.rpm=00;31:*.rz=00;31:*.sar=00;31:*.swm=00;31:*.t7z=00;31:*.tar=00;31:*.taz=00;31:*.tbz=00;31:*.tbz2=00;31:*.tgz=00;31:*.tlz=00;31:*.txz=00;31:*.tz=00;31:*.tzo=00;31:*.tzst=00;31:*.udeb=00;31:*.war=00;31:*.whl=00;31:*.wim=00;31:*.xz=00;31:*.z=00;31:*.zip=00;31:*.zoo=00;31:*.zst=00;31:*.avif=01;33:*.jpg=01;33:*.jpeg=01;33:*.mjpg=01;33:*.mjpeg=01;33:*.gif=01;33:*.bmp=01;33:*.pbm=01;33:*.pgm=01;33:*.ppm=01;33:*.tga=01;33:*.xbm=01;33:*.xpm=01;33:*.tif=01;33:*.tiff=01;33:*.png=01;33:*.svg=01;33:*.svgz=01;33:*.mng=01;33:*.pcx=01;33:*.mov=01;33:*.mpg=01;33:*.mpeg=01;33:*.m2v=01;33:*.mkv=01;33:*.webm=01;33:*.webp=01;33:*.ogm=01;33:*.mp4=01;33:*.m4v=01;33:*.mp4v=01;33:*.vob=01;33:*.qt=01;33:*.nuv=01;33:*.wmv=01;33:*.asf=01;33:*.rm=01;33:*.rmvb=01;33:*.flc=01;33:*.avi=01;33:*.fli=01;33:*.flv=01;33:*.gl=01;33:*.dl=01;33:*.xcf=01;33:*.xwd=01;33:*.yuv=01;33:*.cgm=01;33:*.emf=01;33:*.ogv=01;33:*.ogx=01;33:*.aac=00;33:*.au=00;33:*.flac=00;33:*.m4a=00;33:*.mid=00;33:*.midi=00;33:*.mka=00;33:*.mp3=00;33:*.mpc=00;33:*.ogg=00;33:*.ra=00;33:*.wav=00;33:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'
export PATH=$HOME/scripts:$HOME/.local/bin:$HOME/.dotnet/tools:$PATH
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx
export VISUAL=nano

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#bindkey -v
bindkey "^[[3~" delete-char
bindkey "^[[3;5~" delete-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^H" backward-delete-word
bindkey "^[[1;2D" backward-char
bindkey "^[[1;2C" forward-char

zstyle :compinstall filename '/home/BB/.zshrc'
autoload -Uz compinit
compinit

unsetopt BEEP

autoload -U promptinit
promptinit

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
