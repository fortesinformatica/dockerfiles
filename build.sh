#!/bin/bash
set -e

build_dir () {
  local dir=$1
  echo -e "\e[34mBuilding $dir\e[0m"
  cd $dir
  echo $dir
  ./build.sh
  cd ..
}

build_dir "java"
build_dir "jruby"
build_dir "jruby_swftools"
build_dir "ruby"
build_dir "awscli"
build_dir "postgres"
build_dir "flex-sdk"
# So funciona na aws. Comentar se for rodar local.
build_dir "codedeploy-agent"
