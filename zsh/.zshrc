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

# source ~/.zsh_profile # Always keep at last
