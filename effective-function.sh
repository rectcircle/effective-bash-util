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