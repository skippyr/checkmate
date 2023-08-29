export VIRTUAL_ENV_DISABLE_PROMPT=1

setopt promptsubst

function _checkmate {
  function get_venv {
    [[ ${VIRTUAL_ENV} ]] && echo "<%F{1}${VIRTUAL_ENV##*/}%f> "
  }

  function get_cwd {
    d=("${(s./.)PWD/${HOME}/~}")
    [[ ${#d} -gt 1 ]] && for i in {1..$((${#d} - 1))}; do
      [[ ${d[i]} == .* ]] && d[i]=${d[i][1,2]} || d[i]=${d[i][1]}
    done
    echo ${(j./.)d}
  }

  function stat_dirty {
    [[ $(git status -s 2>/dev/null) ]] && echo "*"
  }

  function get_branch {
    b=$(git branch --show-current 2>/dev/null)
    [[ ${b} ]] && echo "%F{3}git:(%F{1}${b}$(stat_dirty)%F{3}) "
  }
  echo " %(#.%F{1}%f.)%(?.. [%F{1}%?%f]) $(get_venv)$(get_cwd)"\
       "$(get_branch)%f↪ "
}

PROMPT='$(_checkmate)'
