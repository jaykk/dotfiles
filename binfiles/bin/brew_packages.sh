#!/usr/bin/env zsh

tap_list=(versent/taps caskroom/versions)
package_list=(fzf stow lastpass-cli tmux git neovim htop starship jenv pyenv saml2aws hub bat sbt jq)
cask_list=(flycut adoptopenjdk/openjdk/adoptopenjdk8)

brew_taps="$(brew tap)"

for i in ${tap_list} ; do
	findp=$(echo ${brew_taps} | grep -q "^${i}$")
	installed=$?
	if [[ ${installed} -ne 0 ]]; then
		echo brew tap $i
	else
		echo "$i already tapped"
	fi
done


brew_list="$(brew list)"

for i in ${package_list} ; do
	findp=$(echo ${brew_list} | grep -q "^${i}$")
	installed=$?
	if [[ ${installed} -ne 0 ]]; then
		echo "Installing package ${i}"
		brew install ${i}
	else
		echo "${i} already installed"
	fi
done


brew_casks="$(brew cask list)"

for i in ${cask_list} ; do
	findp=$(echo ${brew_casks} | grep -q "^${i}$")
	installed=$?
	if [[ ${installed} -ne 0 ]]; then
		brew cask install $i
	else
		echo "$i already installed"
	fi
done
