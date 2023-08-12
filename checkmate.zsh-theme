export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function __Checkmate()
{
	function Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo "%f<%F{1}${VIRTUAL_ENV##*/}%f> "
	}

	function Get_Directory()
	{
		typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
		[[ ${#directory_splits} -gt 1 ]] &&
			for directory_split_index in {1..$((${#directory_splits} - 1))}; do
				[[ "${directory_splits[directory_split_index]}" == .* ]] &&
					directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
					directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
			done
		echo ${(j./.)directory_splits}
	}

	function Get_Changes()
	{
		[[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
	}

	function Get_Branch()
	{
		typeset -r branch=$(git branch --show-current 2>/dev/null)
		[[ ${branch} ]] && echo " %F{3}git:(%F{1}${branch}$(Get_Changes)%F{3})"
	}

	echo                                                                        \
		"%F{4} %f%(#.%F{1}%f.)%(?.. [%F{1}%?%f])"                             \
		"$(Get_Virtual_Environment)%F{4}$(Get_Directory)$(Get_Branch) %f↪ "
}

PROMPT='$(__Checkmate)'
