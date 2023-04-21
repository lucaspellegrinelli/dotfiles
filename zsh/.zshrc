source ~/.antigen/antigen.sh
source ~/.zsh_profile

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

export PATH="/opt/miniconda/bin:$PATH"
