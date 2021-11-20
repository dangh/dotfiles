#!/usr/bin/env zsh

dotfiles_dir=$(dirname "$0:A")

bootstrap() {
	files=$(git -C "${dotfiles_dir}" ls-files)
	for file in ${(f)files}; do
		dotfile="$dotfiles_dir/$file"
		dotfile="$dotfile:A"
		dotfile_dir=$(dirname $dotfile)
		symlink="$HOME/${file#*/}"
		symlink_dir="$symlink:h"

		[[ "$dotfile_dir" == "$dotfiles_dir" ]] && continue

		if [[ -e "$symlink" && ! -L "$symlink" ]]; then
			printf >&2 -- 'Moving non-linked %s to Trash.\n' "$f"
			/bin/mv -v -- "$symlink" "$HOME/.Trash"
		fi

		mkdir -p "$symlink_dir"
		ln -sfv -- "$dotfile" "$symlink" | sed "s;$HOME;~;g"
	done

	git config --global core.excludesfile '~/.gitignore'
	git config --global core.autocrlf 'input'
	git config --global core.eol 'lf'
	git config --global core.attributesfile '~/.gitattributes'
}

bootstrap
