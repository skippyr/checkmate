setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT="1"

function _checkmate::venv {
	typeset -r venv=${VIRTUAL_ENV##*/}
	[[ -n ${venv} ]] &&
	echo "<%F{magenta}${venv}%f> "
}

function _checkmate::pwd {
	typeset pwd=("${(s./.)PWD/${HOME}/~}")
	[[ ${#pwd} > 1 ]] &&
	for splits_iterator in {1..$((${#pwd} - 1))}; do
		[[ "${pwd[splits_iterator]}" == .* ]] &&
		pwd[splits_iterator]=${pwd[splits_iterator][1,2]} ||
		pwd[splits_iterator]=${pwd[splits_iterator][1]}
	done
	echo ${(j./.)pwd}
}

function _checkmate::changes {
	[[ $(git status --porcelain 2>/dev/null) ]] &&
	echo "*"
}

function _checkmate::branch {
	typeset -r branch=$(git branch --show-current 2>/dev/null)
	[[ -n ${branch} ]] &&
	echo " %F{yellow}git:(%F{red}${branch}$(_checkmate::changes)%F{yellow})%f"
}

PROMPT='%F{blue}%f %(?..[%F{red}%?%f] )%(#.%F{red}.) $(_checkmate::venv)%F{blue}$(_checkmate::pwd)%f$(_checkmate::branch) ↪  '
