ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_HOME_ICON="\ufb32"
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON="\ue5ff"
POWERLEVEL9K_ETC_ICON="\uE5FC"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\ue0c4"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}└%F{cyan}\uf260%f %F{014}\ufb1f%f "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# custom_at_home 和 custom_detect_context 都是自定义的组件，可以删除这两个字段来关闭组件显示
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status dir custom_at_home custom_detect_context vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_COLOR_SCHEME="dark"
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_STATUS_OK=false
# customize theme
POWERLEVEL9K_DIR_HOME_BACKGROUND="023"
POWERLEVEL9K_DIR_HOME_FOREGROUND="010"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="023"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="010"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="023"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="010"
# POWERLEVEL9K_STATUS_OK_BACKGROUND="232"
#===============================
# self defined segments
#===============================
at_home() {
	[ "$(pwd)" = $HOME ] && echo -n "Going Home"
}
POWERLEVEL9K_CUSTOM_AT_HOME="at_home"
POWERLEVEL9K_CUSTOM_AT_HOME_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_AT_HOME_BACKGROUND="cyan"

SUFFIX_MAP=("dockerfile" "node_modules" ".vue" ".py")
ICON_MAP=(
	"\033[34m\uE7B0"
	"\033[32m\uF898"
	"\033[32m\uFD42"
	"\033[35m\uF81F"
)
# 检测当前目录下的 docker、python、vue 等源文件，并显示图标
detect_context() {
	local ls_result=$(ls)
	local result=""

	for ((i = 1; i <= $#SUFFIX_MAP; i++)); do
		if echo $ls_result | grep -Ei "${SUFFIX_MAP[$i]}\$" >/dev/null; then
			if [ -z $result ]; then
				result="${ICON_MAP[$i]}"
			else
				result="$result  ${ICON_MAP[$i]}"
			fi
		fi
	done

	echo -en $result
}
POWERLEVEL9K_CUSTOM_DETECT_CONTEXT="detect_context"
POWERLEVEL9K_CUSTOM_DETECT_CONTEXT_FOREGROUND='white'
POWERLEVEL9K_CUSTOM_DETECT_CONTEXT_BACKGROUND='232'
