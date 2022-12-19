test -r ~/.shell-aliases && . ~/.shell-aliases

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.poetry/bin:$PATH
export GPG_TTY=$(tty)

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

eval "$(direnv hook zsh)"

# Fix shortcode ctrl+shift+e in VS Code on Ubuntu
if [ "$(uname 2> /dev/null)" = "Linux" ]; then
  alias code="GTK_IM_MODULE=xim code"
fi

export VISUAL=nano
export EDITOR="$VISUAL"

# Changing "ls" to "exa"
alias ls='exa --icons --color=always --group-directories-first'
alias ll='exa -alF --icons --color=always --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'

# display npm scripts
npms() {
    local file="${1:-package.json}"
    cat "$file" | jq .scripts
}

if command -v dircolors >/dev/null 2>&1; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

export LS_COLORS="$(vivid generate one-light)"

eval "$(oh-my-posh init zsh --config ~/.poshthemes/.mytheme.omp.json)"
