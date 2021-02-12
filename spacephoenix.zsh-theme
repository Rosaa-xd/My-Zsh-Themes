# ZSH Theme for SpacePhoenix
# Combination of Bira and Essembeh

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host_prefix=''
local user_symbol=''
local user_color=''


if [[ -n "$SSH_CONNECTION" ]]; then
	# Display source address when connected via ssh
	user_host_prefix='%{$fg[yellow]%}[$(echo $SSH_CONNECTION | awk '{print $1}')]%{$reset_color%}'
	user_color='red'
	user_symbol='$'
else
	# Default local session
	user_color='green'
	user_symbol='$'
fi

if [[ $UID = 0 ]]; then
	# Always use magenta for root sessions
	user_color='magenta'
	user_symbol='#'
fi

local user_host='%{$terminfo[bold]$fg[$user_color]%}%n@%m %{$reset_color%}'

local current_dir='%{$terminfo[bold]$fg[blue]%}%~ %{$reset_color%}'
local git_branch='$(git_prompt_info)'
local rvm_ruby='$(ruby_prompt_info)'
local venv_prompt='$(virtualenv_prompt_info)'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"

PROMPT="╭─${user_host_prefix}${user_host}${current_dir}${rvm_ruby}${git_branch}${venv_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
