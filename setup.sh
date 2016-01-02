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
BASHRC_INCLUDE='source ~/mbash/.bashrc'
VIMRC_INCLUDE='source ~/mvim/.vimrc'

# setup bashrc
cp -r $MBASH_DIR $HOME/

if [ $? -eq 0 ]
then
	echo "> Done: copy mbash files to $HOME"
fi

if [ -f $HOME_BASHRC ]
then
	if [ -n "`grep -i "$BASHRC_INCLUDE" $HOME_BASHRC`" ]
	then
		echo "> Already setup bashrc"
	else
		echo $BASHRC_INCLUDE >> $HOME_BASHRC
		echo "> Done: setup bashrc"
	fi
fi

# setup vimrc
cp -r $MVIM_DIR $HOME/

if [ $? -eq 0 ]
then
	echo "> Done: copy mvim files to $HOME"
fi

if [ -f $HOME_VIMRC ]
then
	if [ -n "`grep -i "$VIMRC_INCLUDE" $HOME_VIMRC`" ]
	then
		echo "> Already setup vimrc"
	else
		echo $VIMRC_INCLUDE >> $HOME_VIMRC
		echo "> Done: setup vimrc"
	fi
fi

