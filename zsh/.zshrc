source ~/.antigen/antigen.sh

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply

# p10k styling
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Path setting
export PATH=~/.local/nvim/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source ~/.zsh_profile # Always keep at last
