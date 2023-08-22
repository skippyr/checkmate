export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _checkmate_get_venv() {
  [[ ${VIRTUAL_ENV} ]] && echo "%f<%F{1}${VIRTUAL_ENV##*/}%f> "
}

function _checkmate_get_dir_abbr() {
  local d=("${(s./.)PWD/${HOME}/~}")
  [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
    [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
  done
  echo ${(j./.)d}
}

function _checkmate_get_dirty_changes() {
  [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}

function _checkmate_get_branch() {
  local b=$(git branch --show-current 2>/dev/null)
  [[ ${b} ]] && echo " %F{3}git:(%F{1}${b}$(_checkmate_get_dirty_changes)%F{3})"
}

PROMPT='%F{4} %f%(#.%F{1}%f.)%(?.. [%F{1}%?%f]) $(_checkmate_get_venv)%F{4}\
$(_checkmate_get_dir_abbr)$(_checkmate_get_branch) %f↪ '
