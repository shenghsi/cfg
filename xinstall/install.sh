# to install:
# download this file
# chmod +x install.sh
# ./install.sh
cd $HOME
git clone --bare https://github.com/shenghsi/cfg.git $HOME/.cfg
# 2020-12-19, rename config to cfg
function cfg {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
cfg checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
cfg checkout
cfg config status.showUntrackedFiles no
