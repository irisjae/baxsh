#!/usr/bin/env bash
function lls { 
	ls -1 --group-directories-first ${@}
}

function vvim {
	vim "+set shortmess=I" "+color murphy" "+set nowrap" ${@}
}
