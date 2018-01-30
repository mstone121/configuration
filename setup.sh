#!/bin/sh

if [ -e ~/.zshrc ]
then
    echo "File exists: ~/.zshrc"
else
    ln -s `pwd`/.zshrc ~/.zshrc
fi

if [ ! -d ~/.emacs.d ]
then
    mkdir ~/.emacs.d
fi

if [ -e ~/.emacs.d/init.el ]
then
    echo "File exists: ~/.emacs.d/init.el"
else
    ln -s `pwd`/init.el ~/.emacs.d/init.el
fi