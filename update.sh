#! /bin/bash

# setting directory
if [ -z $APP_DIR ]
then
	APP_DIR=`cd $(dirname $0) && pwd`
fi

# update using git
if [ -z "`type -t git`" ]
then
	echo "> Failed: git not installed"
	exit
fi

# cd to app directory
cd $APP_DIR

# try to checkout to master with quiet mode, not quiet means there is something wrong
CO_CMD="git checkout -q master"
if [ `$CO_CMD` ]
then
	echo "> Failed: cannot checkout to master"
	exit 1
fi

# check if need to pull master
# 1. check working dir is dirty
#CHECK_DIRTY_CMD="git status -suno"
#if [ "`$CHECK_DIRTY_CMD`" ]
#then
#	echo "> Failed: app directory is dirty"
#	exit 1
#fi

# try to pull, pull quietly, not quiet means there is something wrong
UPD_CMD="git pull -q origin master"
if [ "`$UPD_CMD`" ]
then
	echo "> Failed: please re-check app directory"
	exit 1
fi

echo "> Done: updated"

source $APP_DIR/setup.sh
