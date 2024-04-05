export VIRTUAL_ENV_DISABLE_PROMPT=1;

setopt promptsubst;

function _Checkmate_WriteGitDirtyStatusModule()
{
    [[ $(git status -s 2>/dev/null) ]] && echo "*";
}

function _Checkmate_WriteGitModule()
{
    branch=$(git branch --show-current 2>/dev/null);
    [[ ${branch} ]] && echo "%F{yellow}git:(%F{red}${branch}$(_Checkmate_WriteGitDirtyStatusModule)%F{yellow}) ";
}

function _Checkmate_WritePathModule()
{
    pathSplits=("${(s./.)PWD/${HOME}/~}");
    [[ ${#pathSplits} -gt 1 ]] &&
        for index in {1..$((${#pathSplits} - 1))};
        do
            [[ ${pathSplits[index]} == .* ]] &&
                pathSplits[index]=${pathSplits[index][1,2]} ||
                pathSplits[index]=${pathSplits[index][1]};
        done
    echo ${(j./.)pathSplits};
}

function _Checkmate_WriteVirtualEnvModule()
{
    [[ ${VIRTUAL_ENV} ]] && echo "<%F{red}${VIRTUAL_ENV##*/}%f> ";
}

PROMPT=' %(#.%F{red}%f.)%(?.. [%F{red}%?%f]) $(_Checkmate_WriteVirtualEnvModule)$(_Checkmate_WritePathModule) \
$(_Checkmate_WriteGitModule)%f↪ ';
