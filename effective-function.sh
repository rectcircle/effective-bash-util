#!/bin/bash
# 使用方式
# 将一下函数复制到 ~/.bashrc

# 重复执行指令多次
# repeat n cmd
function repeat() {
    number=$1
    shift
    for n in $(seq $number); do
      $@
    done
}

# 拷贝倒数第n个命令到剪切板
# cpc [n]
function cpc(){
    n=1
    if [ x$1 != x ]
    then
        n=$1
    fi

    history | awk '{$1="";print $0}' | sed 's/^ *//' | \
    grep -v '^\s*$' | grep -v 'cpc' | \
    tail -n $n | xsel -b
}

# github创建远程仓库
github_username=rectcircle
github_api_token=<your github api token> #https://github.com/settings/tokens/new

function github_create() {
    if [ $1 ]
    then
        repo_name=$1
    else
        repo_name=`basename $(pwd)`
        echo "set Repo name to ${repo_name}"
    fi 
    curl -u "$github_username:$github_api_token" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
    # git remote add origin git@github.com:username/$repo_name.git
    git remote add origin  https://github.com/$github_username/$repo_name.git
}


# TODO:gitpush
