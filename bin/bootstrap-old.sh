#!/usr/bin/env bash

#-----------------------------------------------------------------------------
# Initialize
#-----------------------------------------------------------------------------

backupdir="$HOME/.dotfiles-backup/$(date "+%Y%m%d%H%M.%S")"
excluded=(. .. .git .gitignore .gitmodules bootstrap.sh install.sh Gemfile Gemfile.lock Rakefile README.md LICENSE)

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------

# Notice title
notice() { echo  -e "\033[1;32m=> $1\033[0m"; }

# Error title
error() { echo -e "\033[1;31m=> Error: $1\033[0m"; }

# backup files currently in $HOME
backup() {
  mkdir -p $backupdir

  pushd $HOME >/dev/null
  local files=( $(ls -la $HOME | grep ^- | awk '{print $9}') )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}" || cp -Rf "$HOME/$file" "$backupdir/$file"
  done
  popd >/dev/null
}

# install files to $HOME
install() {
  local files=( $(ls -la | grep ^- | awk '{print $9}') )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}"
    should_install=$?
    if [ $should_install -gt 0 ]; then
      [ -d "$HOME/$file" ] && rm -rf "$HOME/$file"
      cp -Rf "$file" "$HOME/$file"
    fi
  done
}

# test array
in_array() {
  local hay needle=$1
  shift
  for hay; do
    [[ $hay == $needle ]] && return 0
  done
  return 1
}


main() {

  pushd "$(dirname "${BASH_SOURCE}")" >/dev/null

  notice "Ophalen laatste wijzigingen..."
  git pull origin master

  notice "Veiligstellen oude bestanden ($backupdir)..."
  backup
  
  notice "Installeren..."
  install
  
  popd >/dev/null

}

#-----------------------------------------------------------------------------
# Main
#-----------------------------------------------------------------------------

main
