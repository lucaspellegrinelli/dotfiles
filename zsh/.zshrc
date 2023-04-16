source ~/.antigen/antigen.zsh
source ~/.zsh_profile

# Plugin configuration
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
