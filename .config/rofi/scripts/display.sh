#!/bin/bash

# autorandrのプロファイルを参照し、rofi上の切り替えメニューを作成するスクリプト

function exec() {
  local -ar profiles=`find ~/.config/autorandr/* -type d -printf '%f\n'`

  local -A menu

  for profile in $profiles
  do
    menu["${profile}"]="autorandr --change ${profile}"
  done

  local -r IFS=$'\n'
  [[ $# -ne 0 ]] && eval "${menu[$1]}" || echo "${!menu[*]}"
}

exec $@
