# dotfiles

Installs a set of configurations, plugins and scripts for a quick development environment.

## Overview

Install Homebrew, Git, ZSH, NVM and other common command line utilities quiclky from a single command. It also install common apps like VSCode, Hyper and others, useful to develop.

## Getting Started

Before start I strongly suggest to look at the code inside [install.sh](https://gitlab.com/renemn/dotfiles/blob/master/install.sh), it gives a better perspective of what this do.

### Requirements

Made primarily to work on a macOS system.

### Installation

Just execute the following in your terminal.

```bash
curl -fsSL https://gitlab.com/renemn/dotfiles/raw/master/install.sh | bash
```

## In Depth

### How it works?

1. Installs all the minimum tools needed to clone this repo
2. Clones this repo into a convenient folder `~/Development/dotfiles`
3. Installs the remaining packages and symlink configs
4. Set some defaults to System configuration

### Features

You'll get the next when the installation is done:

* [Homebrew](https://brew.sh/) - The missing package manager for macOS
* [Homebrew-Cask](https://caskroom.github.io/) - Extends Homebrew for macOS applications and large binaries alike
* Command Line Tools without Xcode
* [Git](https://git-scm.com/) - Distributed version control system designed to handle everything
* [Ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher) - A code-searching tool similar to ack, but faster
* [fzy](https://github.com/jhawthorn/fzy) - A better fuzzy finder
* [zsh](http://www.zsh.org/) - A shell designed for interactive use, although it is also a powerful scripting language
* [nvm](https://github.com/nvm-sh/nvm) - Node Version Manager - POSIX-compliant bash script to manage multiple active node.js versions 
* [Node/NPM](https://nodejs.org) (latest version) - JavaScript runtime built on Chrome's V8 JavaScript engine
* [Hyper](https://hyper.is/) - A terminal built on web technologies
  * Plugins: hyper-dark-scrollbar, hyper-material-box, hyperterm-alternatescroll, hyper-statusline
  * Custom theme
* [VSCode](https://code.visualstudio.com/) - IDE that includes support for debugging, embedded Git control and GitHub, syntax highlighting, intelligent code completion, snippets, and code refactoring
  * Plugins: atom-ide-ui, autocomplete-modules, block-travel, file-icons, ide-typescript, language-babel, oceanic-next, pristine-ui, tool-bar, tool-bar-almighty
  * Custom theme (which overwrites pristine-ui)
* [Google Chrome](https://www.google.com/chrome/browser/desktop/index.html) - Fast, secure, and free web browser, built for the modern web
* [Firefox](https://www.mozilla.org/en-US/firefox/) Faster browser, created by a global non-profit dedicated to putting individuals in control online
* [Slack](https://slack.com/) - Where people you need, information you share and tools you use come together to get things done