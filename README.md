###Inspiration###
* http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen
* https://github.com/DeMarko/dotvim

###Installation###
    git clone git://github.com/chucklarge/dotvim.git ~/.vim

###Create symlinks###
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

###Fetch submodules###
    cd ~/.vim
    submodule update --init

###Add a new plugin###
    cd ~/.vim
    git submodule add git://github.com/XXXX/YYYYY.git bundle/YYYYY
    
###Upgrade all plugins###
    git submodule foreach git pull origin master