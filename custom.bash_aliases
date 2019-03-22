# Path setings

export PROJECTS_CS_HOME=${HOME}/Projects
export PROJECTS_WS_HOME=${HOME}/Workspaces
# make workspace & content space
function mkwc() { mkdir "$1_ws" && mkdir -p "$PROJECTS_CS_HOME/$1_cs/src" && ln -s "$PROJECTS_CS_HOME/$1_cs/src"  "$PWD/$1_ws/src" ;}

function gitclonewc() {
  red=`tput setaf 1`
  yello=`tput setaf 3`
  green=`tput setaf 2`
  reset=`tput sgr0`

  projRepoUrl="$1"
  projName="$2"
  # params are required, exit if empty
  if [ -z "$projRepoUrl" ]; then
      echo "usage: gitclonewc <repo url> <opt: repo name>"
      return -1
  fi

  if [ -z "$projName" ]; then
      baseName=$(basename $projRepoUrl)
      projName=${baseName%.*}
      #extensionName=${baseName##*.}
  fi

  projGitPath="$PROJECTS_WS_HOME/.gitfiles/$projName.git"
  echo "Clone \"${yello}$projName${reset}\" under \"${green}$PWD${reset}\""
  echo "with git files to \"${green}$projGitPath${reset}\""
  mkdir -p "$PROJECTS_WS_HOME/.gitfiles"
  git clone $projRepoUrl $projName --separate-git-dir $projGitPath
}

function gitinitwc() {
  red=`tput setaf 1`
  yello=`tput setaf 3`
  green=`tput setaf 2`
  reset=`tput sgr0`

  projName="$1"

  if [ -z "$projName" ]; then
      projName=$(basename $PWD)
  fi

  projGitPath="$PROJECTS_WS_HOME/.gitfiles/$projName.git"
  echo "Init \"${yello}$projName${reset}\" under \"${green}$PWD${reset}\""
  echo "with git files to \"${green}$projGitPath${reset}\""
  mkdir -p "$PROJECTS_WS_HOME/.gitfiles"
  git init --separate-git-dir $projGitPath
}
