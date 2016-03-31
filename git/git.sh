#!/bin/bash

if [ "$#" -ne 2 ];then
  echo "$0 git_updir github_git"
  exit 1
fi
git_dir=$1
git_name=$2

test -d "$git_dir/.git" || git init $git_dir
(cd $git_dir && git add . &>/dev/null;
git commit -m "auto git" &>/dev/null;
if `git branch --list | grep master` &>/dev/null;then
    git push origin master
else
    git remote add origin "git@github.com:lizhenfen/${git_name}.git"
    git push  origin master 
fi
)
