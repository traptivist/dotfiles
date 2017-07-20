export RXVT_SOCKET='/tmp/urxvt-socket'

# Add ~/.bin to path
PATH="${PATH}:${HOME}/.bin"

# Fix smooth scroll in Firefox
export MOZ_USE_OMTC=1

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory
setopt sharehistory
setopt hist_reduce_blanks
setopt hist_ignore_all_dups
setopt nobeep
setopt extended_glob
setopt nonomatch
setopt extended_history
setopt inc_append_history
setopt notify
setopt correctall
setopt noflowcontrol
setopt nohup
setopt checkjobs
setopt autocd
setopt longlistjobs
setopt hash_list_all
setopt completeinword
typeset -U path cdpath fpath manpath
setopt IGNORE_EOF

setopt AUTO_LIST
setopt AUTO_MENU
setopt MENU_COMPLETE

# Completion caching
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path .zcache
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*:*:*:default' menu yes select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

setopt AUTO_CD
autoload -U promptinit; promptinit
preexec () { print -Pn "\e]2;urxvt::$1\a" }

# Aliases
alias lock='sh /home/traptivist/.bin/lock.sh'
alias scr='sh /home/traptivist/.bin/scr'
alias qtbrw='qutebrowser --backend webengine'
alias tvb='mpv --ytdl-format=22 $1'
alias tvm='mpv --ytdl-format=18 $1'
alias tvhq='mpv --ytdl-format="bestvideo[ext=mp4][height<=?1080]+bestaudio[ext=m4a]" $1'
alias ytb=youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best $1'
alias ytm=youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480] $1'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias clu='sudo pacman -Rns $(pacman -Qtdq)'
alias slurm='slurm -z -i enp2s0'
alias feh='feh -g 640x480 -d -S filename $HOME/Imágenes $1'

source "$HOME/.cache/wal/colors.sh"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ls aliases
alias ls='ls --color=auto'
alias lsa='ls -A --color=auto'
alias lsl='ls -lh --color=auto'
alias lsla='ls -Alh --color=auto'
alias lso='ls -A | grep --color=auto'
alias lsr='ls -R'
alias lslr='ls -lR'
alias lsd='ls -d */'
alias lsld='ls -dl */'
alias lslo='ls -Alh | grep --color=auto'
alias lsonly='ls -A | grep --color=auto'
alias lslonly='ls -Alh | grep --color=auto'

# play some music with mpv with youtube as source
function mm() {
    mpv --no-video --ytdl-format=bestaudio ytdl://ytsearch10:"$@"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Used for Wal to generate colors
(wal -r &)

