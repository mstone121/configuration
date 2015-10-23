#!/bin/sh

# Config dir
dir=~/stuff/configuration


# Emacs init.el
if [ ! -d ~/.emacs.d ]
then

	mkdir ~/.emacs.d

fi

if [ -e ~/.emacs.d/init.el ]
then

	echo "File exists: ~/.emacs.d/init.el"

else
	
	ln -s "${dir}/init.el" ~/.emacs.d/init.el

fi


# .zshrc
if [ -e ~/.zshrc ]
then

	echo "File exists: ~/.zshrc"

	# Attempt append
	if [ grep -q ". ~/.zshrc.local" ]
	then

		echo ". ~/.zshrc.local" >> ~/.zshrc

	fi

else

	ln -s "${dir}/.zshrc" ~/.zshrc
	
fi

# .zshrc.local
if [ -e ~/.zshrc.local ]
then

	echo "File exists: ~/.zshrc.local"

else
	
	ln -s "${dir}/.zshrc.local" ~/.zshrc.local

fi

# coins-server.sh
if [ -e /etc/init/coins-server.sh ]
then

	echo "File exists: coins-server.sh"

else

	ln -s "${dir}/coins-server.sh" /etc/init/coins-server.sh

fi

