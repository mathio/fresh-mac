# Locale
export LC_CTYPE=en_US.UTF-8;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# extract git branch name for prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /'
}
# Fancy prompt: user@host (magenta) working_dir (green) git_branch (red) $(magenta)
# Color: https://en.wikipedia.org/wiki/ANSI_escape_code#Colors
#export PS1="\[\e[95m\]\u@\h \[\e[92m\]\W \[\e[91m\]\$(parse_git_branch)\[\e[95m\]$\[\e[00m\] "

# Fancy prompt (magenta): user@host working_dir git_branch $
export PS1="\[\e[95m\]\u@\h \W \$(parse_git_branch)\[\e[95m\]$\[\e[00m\] "

source ~/.aliases

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
