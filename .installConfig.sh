function removeOldConfig {
sed -i.bak '/source.*\.mouseZeroConfig/d' $1
}

installDir=~/.mouseZeroConfig
ARRAYCONFIG=(/.bashrc /.tmux.conf /.vimrc.local /.vimrc.before.local /.vimrc.bundles.local)

mkdir -p $installDir
mkdir -p ~/.tmuxinator

for i in ${ARRAYCONFIG[@]};do
    cp .${i} $installDir'/'
    removeOldConfig $HOME${i}
    echo source $installDir${i} >> $HOME${i}
done

cp ./.Bable.yml ~/.tmuxinator/Bable.yml
vim +PluginInstall +qall



