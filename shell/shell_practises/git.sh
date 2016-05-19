#!/bin/bash
#初始化项目 sh git.sh lcoal_dir <Repository Name>既可


#当手动在github的web上修改数据后,先进入repo文件执行 
#git pull <remote> <breach>
#git pull origin master
#origin 是初始化时指定的名称
if [ "$#" -ne 2 ];then
  echo "$0 git_updir github_git"
  exit 1
fi
git_dir=$1
git_name=$2

test -d "$git_dir/.git" || git init $git_dir
(cd $git_dir && git add . &>/dev/null;
git commit -a -m "auto git" &>/dev/null;
if `git branch --list | grep master` &>/dev/null;then
    git push origin master
else
    git remote add origin "git@github.com:lizhenfen/${git_name}.git"
    git push  origin master 
fi
)
