#!/bin/bash


#showHelp
#read -p "Please choose usage (bak/auto):" usage
#echo "Now doint it  .... ...."
#echo " "

#set -x
############ Local varibal
srcPluginPath=~/.vim/myplugin
dstPluginPath=~/.vim/bundle


############ backup the old vim stuff
mkdir -p ~/vim-bak
mv ~/.vimrc ~/vim-bak/vimrc.bak
#rm ~/.vim/* -rf

############ install lemon vim stuff
ln -s ~/.vim/vimrc ~/.vimrc
mkdir -v $dstPluginPath/
cd $dstPluginPath
git clone https://github.com/gmarik/vundle.git
cd -
echo " "
#cp $srcPluginPath/vundle $dstPluginPath/vundle
#cp ../bundle ~/.vim/ -rf
#cp ../lemon-tool ~/.vim/ -rf
#cp ../doc ~/.vim/ -rf

###########  Install plugins online
echo "Get in the VIM to install plugin with BundleInstall command ..."
sleep 3
vim
echo " "

###########  Customize private plugins 
# my theme
cp $srcPluginPath/desertmss.vim $dstPluginPath/desertEx/colors/

echo "Comment the 122 lines of vimrc"
sleep 2
vim +122 $dstPluginPath/Mark/plugin/mark.vim
echo " "

echo "Comment the 95 lines of mark.vim file"
sleep 2
vim +95 $dstPluginPath/Mark/plugin/mark.vim
echo " "

echo "Copy the c&sh snippets.."
sleep 2
rm $dstPluginPath/snipMate/snippets/c.snippets $dstPluginPath/snipMate/snippets/sh.snippets 
ln -s $srcPluginPath/c.snippets  $dstPluginPath/snipMate/snippets/c.snippets 
ln -s $srcPluginPath/sh.snippets $dstPluginPath/snipMate/snippets/sh.snippets
echo " "

########### Other actions
echo "Manual actions:"
echo "1. Add private bin path '~/.vim/lemon-tool/' to PATH"
