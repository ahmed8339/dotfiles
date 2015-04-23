# phatblat's dotfiles

This is my mostly-boring configuration files. I regularly switch between three different Macs and use this repo to sync terminal and some GUI app configurations across them. 

This repo is checked out at the root of my user home dir. This confuses some git apps like Tower because I have lots of git repos in subdirectories. But, I prefer to see the dirty and upstream marker changes when I'm sitting in my home dir. I have `*` ignored in `~/.git/info/exclude` because only a few config files are tracked. This requires `--force` when adding new tracked files.

I use a [customized version](https://github.com/phatblat/dotfiles/blob/master/.oh-my-zsh/themes/agnoster-phatblat.zsh-theme) of the [agnoster](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/agnoster.zsh-theme) theme for oh-my-zsh.

## Git

My `~/.gitconfig` is checked in but I use different `user.email` values on my work and personal Macs. This is accomplished by setting local-only values in the alternate user-global [`~/.config/git/config`](http://git-scm.com/docs/git-config#FILES), but is overridden on an as-needed basis by explicitly setting `user.email` in some repos.

I've crafted a slew of short [aliases](https://github.com/phatblat/dotfiles/blob/master/.dotfiles/git/alias.zsh) for all the commands I use regularly. There's even a fancy experimental [bundle-pull script](https://github.com/phatblat/dotfiles/blob/master/.dotfiles/git/bundle-pull.rb) for quickly syncing a dirty work tree from one Mac to another.

## iOS

There are some fancy functions for easily inspecting, bumping version and releasing an app with a versioned [xcode project](https://github.com/phatblat/dotfiles/blob/master/.dotfiles/ios/alias.zsh).

## Credit

Inspired by https://github.com/rtomayko/dotfiles
