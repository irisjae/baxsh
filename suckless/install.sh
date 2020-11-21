#!/usr/bin/env bash
[[ ! -z "$EDITOR" ]] || {
	echo '$EDITOR is empty' >&2
	exit 1
} && {
	cd ~
} && which dvtm || {
	sudo apt-get install -y build-essential
	sudo apt-get install -y libncurses5-dev libncursesw5-dev
	git clone https://github.com/martanne/dvtm.git
	pushd dvtm
	$EDITOR config.mk && $EDITOR config.def.h && make && sudo make install
	popd
	sudo mv dvtm /usr/local/src
} || {
	echo 'failed getting dvtm' >&2
	exit 1
} && which abduco || {
	git clone https://github.com/martanne/abduco.git
	pushd abduco
	./configure && make && sudo make install
	popd
	sudo mv abduco /usr/local/src
} || {
	echo 'failed getting abduco' >&2
	exit 1
} && which vis || {
	sudo apt-get install -dev libtermkey-dev
	sudo apt-get install -dev liblua5.3-dev
	git clone https://github.com/martanne/vis.git
	pushd vis
	./configure && make && sudo make install
	popd
	sudo mv vis /usr/local/src ;}
