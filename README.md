# config
store all config files for quick access

## Vim

Need to install Vundle for it to work
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Copy config
```
cp vim/.vimrc ~/
```

Finally, in vim, run `:PluginInstall` to install all plugins

## Fish

Includes prompt and color scheme
```
cp -r fish ~/.config/
```

## iTerm

Load the config from the general page and point to `com.googlecode.iterm2.plist`. If not properly loaded, also import the color preset `Atom.itermcolors` from the _Profile->Colors_ menu.

## tmux
tmux config
```
cp tmux/.tmux.conf ~/
```
