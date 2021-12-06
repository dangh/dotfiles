#!/usr/bin/env zsh

script="$0:A"
script_dir=$(dirname $script)
app=$1

for src in "${@:2}"; do
  dst="${src/$HOME/$script_dir/$app}"
  dir="$dst:h"
  mkdir -p $dir
  if [[ $src = $HOME/Library/Preferences/* ]]; then
    cp -fv -- "$dst" "$src" | sed "s;$HOME;~;g"
  else
    mv -v -- "$src" "$dst"
    ln -sfv -- "$dst" "$src" | sed "s;$HOME;~;g"
  fi
done
