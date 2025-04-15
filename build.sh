#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

docker build -t registry.cn-zhangjiakou.aliyuncs.com/hengruizhineng/think-server:24.10 .

docker push registry.cn-zhangjiakou.aliyuncs.com/hengruizhineng/think-server:24.10
