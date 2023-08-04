setopt promptsubst
export VIRTUAL_ENV_DISABLE_PROMPT=1

_checkmate() {
  get_virtual_environment() {
    [[ ${VIRTUAL_ENV} ]] && echo "%f<%F{1}${VIRTUAL_ENV##*/}%f> "
  }

  get_directory() {
    typeset -a directory_splits=("${(s./.)PWD/${HOME}/~}")
    [[ ${#directory_splits} -gt 1 ]] &&
      for directory_split_index in {1..$((${#directory_splits} - 1))}; do
        [[ "${directory_splits[directory_split_index]}" == .* ]] &&
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1,2]} ||
          directory_splits[directory_split_index]=${directory_splits[directory_split_index][1]}
      done
    echo ${(j./.)directory_splits}
  }

  get_changes() {
    [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
  }

  get_branch() {
    typeset -r branch=$(git branch --show-current 2>/dev/null)
    [[ ${branch} ]] && echo " %F{3}git:(%F{1}${branch}$(get_changes)%F{3})"
  }

  echo\
    "%F{4} %f%(?..[%F{1}%?%f] )%(#.%F{1}.)"\
    "$(get_virtual_environment)%F{4}$(get_directory)$(get_branch) %f↪ "
}

PROMPT='$(_checkmate)'
