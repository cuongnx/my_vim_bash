#! /bin/bash

# setting directory
if [ -z $APP_DIR ]
then
	APP_DIR=`cd $(dirname $0) && pwd`
fi
HOME_BASHRC="$HOME/.bashrc"
HOME_VIMRC="$HOME/.vimrc"
MBASH_DIR="$APP_DIR/mbash"
MVIM_DIR="$APP_DIR/mvim"

# command to include in corresponding file
BASHRC_INCLUDE="source $APP_DIR/.bashrc"
VIMRC_INCLUDE="source $APP_DIR/.vimrc"

# setup bashrc
bashrc_setup=1
if [ -f $HOME_BASHRC ]
then
	if [ -n "`grep -i "$BASHRC_INCLUDE" $HOME_BASHRC`" ]
	then
		bashrc_setup=0
		echo "> Already setup bashrc"
	fi
fi
if (($bashrc_setup)); then echo $BASHRC_INCLUDE >> $HOME_BASHRC && echo "> Done: setup bashrc"; fi

# setup vimrc
vimrc_setup=1
if [ -f $HOME_VIMRC ]
then
	if [ -n "`grep -i "$VIMRC_INCLUDE" $HOME_VIMRC`" ]
	then
		vimrc_setup=0
		echo "> Already setup vimrc"
	fi
fi
if (($vimrc_setup)); then echo $VIMRC_INCLUDE >> $HOME_VIMRC && echo "> Done: setup vimrc"; fi
