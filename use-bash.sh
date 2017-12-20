#!/usr/bin/env bash
function lls { 
	ls -1 --group-directories-first "${@}"
}

function vvim {
	vim "+set shortmess=I" "+color murphy" "+set nowrap" "${@}"
}

__screen_config=$(mktemp)
echo "layout save default" > ${__screen_config}
function sscreen {
	screen -c "$__screen_config" "${@}"
}
