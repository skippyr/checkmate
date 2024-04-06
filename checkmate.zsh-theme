setopt promptsubst;

export VIRTUAL_ENV_DISABLE_PROMPT=1;

_checkmate_write_git_dirty_status_module() {
  [[ $(git status -s 2>/dev/null) ]] && echo "*";
}

_checkmate_write_git_module() {
  branch=$(git branch --show-current 2>/dev/null);
  [[ ${branch} ]] &&
      echo "%F{yellow}git:(%F{red}${branch}$(_checkmate_write_git_dirty_status_module)%F{yellow}) ";
}

_checkmate_write_path_module() {
  path_splits=("${(s./.)PWD/${HOME}/~}");
  [[ ${#path_splits} -gt 1 ]] &&
      for index in {1..$((${#path_splits} - 1))};
      do
        [[ ${path_splits[index]} == .* ]] &&
            path_splits[index]=${path_splits[index][1,2]} ||
            path_splits[index]=${path_splits[index][1]};
      done
  echo ${(j./.)path_splits};
}

_checkmate_write_virtual_env_module() {
  [[ ${VIRTUAL_ENV} ]] && echo "<%F{red}${VIRTUAL_ENV##*/}%f> ";
}

PROMPT=' %(#.%F{red}%f.)%(?.. [%F{red}%?%f]) \
$(_checkmate_write_virtual_env_module)$(_checkmate_write_path_module) \
$(_checkmate_write_git_module)%f↪ ';
