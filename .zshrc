# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

plugins=(git )

source /home/sheep/.oh-my-zsh/oh-my-zsh.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# alias
source /home/sheep/.zshalias

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Freeze and unfreeze processes (for example: stop firefox)
 stop(){
   if [ $# -ne 1 ]; then
           echo 1>&2 Usage: stop process
  else
     PROCESS=$1
     echo "Stopping processes with the word ${tGreen}$1${tReset}"
     ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -STOP
   fi
 }

cont(){
    if [ $# -ne 1]; then 
            echo 1>&2 Usage: cont process
    else
      PROCESS=$1
      echo "Continuing processes with the word ${tGreen}$1${tReset}"
      ps axw | grep -i $1 | awk -v PROC="$1" '{print $1' | xargs kill
      -CONT
        fi
}
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
