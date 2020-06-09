#!/bin/zsh
brew list > brewlist
brew cask list  > brewcasklist
ls -l /Applications | sed -E 's/.*[0-9]+ //' > macApplist
pip list > piplist
