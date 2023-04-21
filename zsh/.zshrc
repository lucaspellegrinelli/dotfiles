source ~/.antigen/antigen.sh

antigen use oh-my-zsh
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k
antigen apply

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

source ~/.zsh_profile # Always keep at last
