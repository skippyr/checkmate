setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

__Checkmate()
{
	Get_Virtual_Environment()
	{
		[[ ${VIRTUAL_ENV} ]] && echo "%f<%F{1}${VIRTUAL_ENV##*/}%f> "
	}

	Get_Directory()
	{
		typeset -a d=("${(s./.)PWD/${HOME}/~}")
		[[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
			[[ "${d[i]}" == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
		done
		echo ${(j./.)d}
	}

	Get_Changes()
	{
		[[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
	}

	Get_Branch()
	{
		typeset -r b=$(git branch --show-current 2>/dev/null)
		[[ ${b} ]] && echo " %F{3}git:(%F{1}${b}$(Get_Changes)%F{3})"
	}

	echo\
		"%F{4} %f%(?..[%F{1}%?%f] )%(#.%F{1}.)"\
		"$(Get_Virtual_Environment)%F{4}$(Get_Directory)$(Get_Branch) %f↪ "
}

PROMPT='$(__Checkmate)'
