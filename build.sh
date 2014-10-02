#!/bin/bash

build_dir () {
  local dir=$1
  echo -e "\e[34mBuilding $dir\e[0m"
  cd $dir
  echo $dir
  ./build.sh
  cd ..
}

build_dir "ubuntu"
build_dir "java"
build_dir "jruby"
build_dir "jruby_swftools"
build_dir "ruby"
build_dir "awscli"
