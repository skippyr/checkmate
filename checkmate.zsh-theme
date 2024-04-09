setopt promptsubst;

export VIRTUAL_ENV_DISABLE_PROMPT=1;

function _checkmate_writeGitDirtyStatusModule()
{
	[[ $(git status -s 2>/dev/null) ]] && echo "*";
}

function _checkmate_writeGitModule()
{
	branch=$(git branch --show-current 2>/dev/null);
	[[ ${branch} ]] && echo "%F{yellow}git:(%F{red}${branch}$(_checkmate_writeGitDirtyStatusModule)%F{yellow}) ";
}

function _checkmate_writePathModule()
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

function _checkmate_writeVirtualEnvModule()
{
	[[ ${VIRTUAL_ENV} ]] && echo "<%F{red}${VIRTUAL_ENV##*/}%f> ";
}

PROMPT=' %(#.%F{red}%f.)%(?.. [%F{red}%?%f]) $(_checkmate_writeVirtualEnvModule)$(_checkmate_writePathModule) \
$(_checkmate_writeGitModule)%f↪ ';
