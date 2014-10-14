About
=====

This is the repository containing my dotfiles, most notably my vim
configuration.

Installation
============

This repository uses git submodules to track vim plugins.
If you don't know what git submodules are, you can find information
[here](http://git-scm.com/book/en/Git-Tools-Submodules).

To install the dotfiles, run `./install.zsh` in the root of the repository.
The install script assumes you're not running it from another directory, it
won't work if you do so!
The script initiates the submodules in case you haven't cloned the repository
with the --recursive option, then links the dotfiles.

The install script makes simlink from the repository to your home directory,
the purpose being to ease updating. That means you musn't remove the
repository, or you'll have dangling simlinks!
If you don't want that behaviour, copy the files yourself from the
repository, but don't forget to run
`git submodule init && git submodule update` first!


Vim plugins
===========

My vim setup uses the following plugins :

* [Bundler](https://github.com/tpope/vim-bundler) : bundler integration in vim
* [Fugitive](https://github.com/tpope/vim-fugitive) : git wrapper
* [Rails](https://github.com/tpope/vim-fugitive) : rails integration in vim
* [Surround](https://github.com/tpope/vim-surround) : command related to
* [Repeat](https://github.com/tpope/vim-repeat) : repeat Surround and
* [Unimpaired](https://github.com/tpope/vim-unimpaired) : mappings for commands
* [CtrlP](https://github.com/kien/ctrlp.vim/) : fuzzy file finder
* [Rainbow parentheses](https://github.com/kien/rainbow\_parentheses.vim) : Parentheses coloration
* [Jellybeans](https://github.com/nanotech/jellybeans.vim) : Vim color scheme
* [NERDCommenter](https://github.com/scrooloose/nerdcommenter) : quickly comment/decomment code
* [NERDTree](https://github.com/scrooloose/nerdtree) : filesystem explorer
* [Syntastic](https://github.com/scrooloose/syntastic) : syntax checking on the fly
* [Powerline](https://github.com/Lokaltog/vim-powerline) : fancy status line
* [Easymotion](https://github.com/Lokaltog/vim-easymotion) Visual motion selector
* [Sparkup](https://github.com/rstacruz/sparkup) : quick HTML creation surroundings
* [Tagbar](https://github.com/majutsushi/tagbar) : tag browser
* [UltiSnips](https://github.com/SirVer/ultisnips) : snippets engine that come in pair Unimpaired commands with .
* [DoxygenTookit](https://github.com/vim-scripts/DoxygenToolkit.vim) : Doxygen generation
* [Clang complete](https://github.com/Rip-Rip/clang_complete) : uses clang for accurately completing C and C++ code
* [Python Mode](https://github.com/klen/python-mode) : All you need for python in vim
* [Vim snippets](https://github.com/honza/vim-snippets) : UltiSnip default snippets
