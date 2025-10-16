# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ~/.zshplugins ]; then
    source ~/.zshplugins
fi

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

if [ -f ~/.workvars ]; then
    source ~/.workvars
fi

if [ -f ~/.exports ]; then
    source ~/.exports
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export PATH="/Users/muoki/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/usr/local/go/bin:$PATH"


eval "$(zoxide init --cmd cd zsh)"
source <(fzf --zsh)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export CLICOLOR=1

## direnv

eval "$(direnv hook zsh)"

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

encrypt_with_kms() {
    if [[ $# -ne 3 ]]; then
        echo "Usage: encrypt_with_kms <region> <key-id> <plaintext>"
        return 1
    fi

    local region="$1"
    local key_id="$2"
    local plaintext="$3"

    aws kms encrypt --region "$region" \
        --key-id "$key_id" \
        --plaintext "$(echo -n "$plaintext" | base64)" \
        --output text \
        --query CiphertextBlob
}

decrypt_with_kms() {
    if [[ $# -ne 3 ]]; then
        echo "Usage: decrypt_with_kms <region> <key-id> <ciphertext>"
        return 1
    fi

    local region="$1"
    local key_id="$2"
    local ciphertext="$3"

    aws kms decrypt --region "$region" \
        --key-id "$key_id" \
        --ciphertext-blob "$ciphertext" \
        --output text \
        --query Plaintext | base64 -d
}


# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

eval "$(~/.local/bin/mise activate zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
export PATH="/opt/homebrew/opt/mysql@8.4/bin:$PATH"

eval "$(/Users/calebmuoki/.local/bin/mise activate zsh)" # added by https://mise.run/zsh
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
