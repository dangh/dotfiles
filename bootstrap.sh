#!/usr/bin/env zsh

script="$0:A"
srcDir=$(dirname $script)

bootstrap() {
	for f in $(git -C $srcDir ls-files); do
		src="$srcDir/$f"
		src="$src:A"
		dst="$HOME/$f"
		dir="$dst:h"

		[[ "$src" == "$script" ]] && continue

		if [[ -e "$dst" && ! -L "$dst" ]]; then
			printf >&2 -- 'Moving non-linked %s to Trash.\n' "$f"
			/bin/mv -v -- "$dst" "$HOME/.Trash"
		fi

		mkdir -p "$dir"
		ln -sfv -- "$src" "$dst"
	done
}

bootstrap
