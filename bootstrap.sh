#!/usr/bin/env zsh

dotfiles_dir=$(dirname "$0:a")

bootstrap() {
	dotfiles=$(git -C "${dotfiles_dir}" ls-files)
	for dotfile in ${(f)dotfiles}; do
		# ignore scripts
		[[ "$dotfile:h" = '.' ]] && continue

		source_file="$dotfiles_dir/$dotfile"
		source_file="$source_file:a" # resolve absolute path
		source_dir="$source_file:h" # resolve dir name
		target_file="$HOME/${dotfile#*/}"
		target_dir="$target_file:h"

		mkdir -p "$target_dir"
		rm -fv "$target_file" | sed "s;$HOME;~;g"
		if [[ "$dotfile:e" = 'plist' ]]; then
			cp -fv "$source_file" "$target_file" | sed "s;$HOME;~;g"
		else
			ln -sfv -- "$source_file" "$target_file" | sed "s;$HOME;~;g"
		fi
	done

	git config --global core.excludesfile '~/.gitignore'
	git config --global core.autocrlf 'input'
	git config --global core.eol 'lf'
	git config --global core.attributesfile '~/.gitattributes'

	defaults write ~/Library/Preferences/com.colliderli.iina inputConfigs -dict d ~/Library/Application\ Support/com.colliderli.iina/input_conf/d.conf
}

bootstrap
