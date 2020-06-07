#!/bin/zsh
brew cask list  > brewcasklist
brew list > brewlist
ls -l /Applications | sed -E 's/.*[0-9]+ //' > macApplist
pip3 list > pip3list
pip list > piplist
