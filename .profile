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

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


