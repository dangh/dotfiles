#!/usr/bin/env zsh

dotfiles_dir=$(dirname "$0:A")

bootstrap() {
	files=$(git -C "${dotfiles_dir}" ls-files)
	for file in ${(f)files}; do
		dotfile="$dotfiles_dir/$file"
		dotfile="$dotfile:A"
		dotfile_dir=$(dirname $dotfile)
		target="$HOME/${file#*/}"
		target_dir="$target:h"

		[[ "$dotfile_dir" == "$dotfiles_dir" ]] && continue

		if [[ -e "$target" && ! -L "$target" ]]; then
			printf >&2 -- 'Moving non-linked %s to Trash.\n' "$f"
			/bin/mv -v -- "$target" "$HOME/.Trash"
		fi

		mkdir -p "$target_dir"
		if [[ $target_dir/ = $HOME/Library/Preferences/* ]]; then
			rm -f "$target" > /dev/null
			cp -fv "$dotfile" "$target" | sed "s;$HOME;~;g"
		else
			ln -sfv -- "$dotfile" "$target" | sed "s;$HOME;~;g"
		fi
	done

	git config --global core.excludesfile '~/.gitignore'
	git config --global core.autocrlf 'input'
	git config --global core.eol 'lf'
	git config --global core.attributesfile '~/.gitattributes'

	defaults write ~/Library/Preferences/com.colliderli.iina inputConfigs -dict d ~/Library/Application\ Support/com.colliderli.iina/input_conf/d.conf
}

bootstrap
