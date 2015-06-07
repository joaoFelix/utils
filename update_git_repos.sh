#!/bin/sh

###################################################################
# Update Git Repos
#
# ./update_git_repos.sh [repos_dir]
#
# repos_dir: the Git repos parent directory (defaults to $HOME)
###################################################################

REPOS_DIR="$HOME";

if [ "$#" -eq 1 ]; then
  REPOS_DIR="$1";
fi

echo "Updating Git repos in $REPOS_DIR\n";

for DIR in $(find $REPOS_DIR -type d -maxdepth 1); do

  #Git repos contain a ".git" directory
  if [ -d "$DIR/.git" ]; then
    echo "Updating $DIR";
    (cd $DIR && git checkout master && git pull --rebase);
    echo "\n";
  fi

done
