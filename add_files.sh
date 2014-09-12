#! /usr/bin/zsh

CONFIG=~/configs

for file in "$@"
do
    if [ -e $HOME/$file ]
    then
        echo "Move $file into $CONFIG"
        mv $HOME/$file $CONFIG
        echo "Create symbolic $file into $HOME"
        ln -s $CONFIG/$file $HOME
        read -q "REPLY?Do you want to add it to git?[y/n] "
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            cd $CONFIG
            git add $file
            echo "$file added to git in $CONFIG"
        fi
    fi
done
