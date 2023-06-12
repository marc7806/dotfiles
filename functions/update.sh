#!/bin/bash
echo 'Updating the system'

echo \n'🍺 Updating homebrew'
brew update
brew upgrade
brew upgrade --cask
brew cleanup

echo \n'⚙️  Updating macOS'
/usr/sbin/softwareupdate -ia
