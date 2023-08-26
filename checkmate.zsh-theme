export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

_c_get_venv() {
	[[ ${VIRTUAL_ENV} ]] && "<%F{1}${VIRTUAL_ENV##*/}%f> "
}

_c_get_abbr_dir() {
	d=("${(s./.)PWD/${HOME}/~}")
	[[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
		[[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
	done
	echo ${(j./.)d}
}

_c_get_drt_changes() {
	[[ $(git status -s 2>/dev/null) ]] && echo "*"
}

_c_get_branch() {
	b=$(git branch --show-current 2>/dev/null)
	[[ ${b} ]] && echo " %F{3}git:(%F{1}${b}$(_c_get_drt_changes)%F{3})"
}

PROMPT='%F{4} %f%(#.%F{1}%f.)%(?.. [%F{1}%?%f]) $(_c_get_venv)%F{4}\
$(_c_get_abbr_dir)$(_c_get_branch) %f↪ '
