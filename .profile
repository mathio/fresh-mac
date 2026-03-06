# Locale
export LC_CTYPE=en_US.UTF-8;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Remap tilde (if not remapped via BetterTouchTool)
#hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}]}'

# extract git branch name for prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}
# Fancy prompt: user@host (red) working_dir (green) git_branch (cyan) $(red)
# Color: https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
export PS1="\[\e[91m\]\u@\h \[\e[92m\]\W \[\e[96m\]\$(parse_git_branch)\[\e[91m\]$\[\e[00m\] "

# Fancy prompt (cyan): user@host working_dir git_branch $
#export PS1="\[\e[96m\]\u@\h \W \$(parse_git_branch)$\[\e[00m\] "

source ~/.aliases

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
