#!/bin/bash
# display tputcolors and text modes

echo
echo -e "$(tput bold) reg  bld  und  itl   tput-command-colors$(tput sgr0)"

for i in $(seq 1 7); do
  echo " $(tput setaf $i)Text$(tput sgr0) $(tput bold)$(tput setaf $i)Text$(tput sgr0) $(tput sgr 0 1)$(tput setaf $i)Text$(tput sgr0) $(tput sitm)$(tput setaf $i)Text$(tput sgr0)  \$(tput setaf $i)"
done

echo
echo " $(tput bold)Bold$(tput sgr0)                 \$(tput bold)"
echo " $(tput sgr 0 1)Underline$(tput sgr0)            \$(tput sgr 0 1)"
echo " $(tput sitm)Italic$(tput sgr0)               \$(tput sitm)"
echo " Reset                \$(tput sgr0)"
echo
