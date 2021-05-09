fzfgit scripts
==============

These scripts come from [dotbare](https://github.com/kazhala/dotbare) and are modified to work with a regular git directory.

Installation:
------------

```sh
git clone https://github.com/lmburns/fzfgit.git
cd fzfgit
make install
```

Dependencies:
------------
- [`fzf`](https://github.com/junegunn/fzf)
  - macOS: `brew install fzf`
- [`bat`](https://github.com/sharkdp/bat)
  - macOS: `brew install bat`

Scripts (from [dotbare](https://github.com/kazhala/dotbare))
-------
fadd
----
Select files/directories or modified files through fzf and stage the selected files/directories.

  - Default: list all modified files and stage selected files. Support multi selection.
  - `-h, --help`: show the help message of `fadd` and exit.
  - `-f, --file`: list all files in current directory and stage selected files. Support multi selection. (Used for staging new files to index).
  - `-d, --dir`: list all directory under current directory and stage selected directory. Support multi selection. (Used for staging new files to index).


fcheckout
---------
Checkout files/commit/branch interactively through fzf.

  - Default: list all modified files and reset selected files back to HEAD. Support multi selection. (Discard all changes) **Note**: if your file is staged, you will need to unstage first before running fcheckout to make it work.
  - `-h, --help`: show the help message of `fcheckout` and exit.
  - `-s, --select`: list all tracked files and select a commit to checkout the selected files. Support multi selection.
  - `-b, --branch`: list all branch and switch/checkout the selected branch.
  - `-c, --commit`: list all commits and checkout selected commit.
  - `-y, --yes`: acknowledge all actions that will be taken and skip confirmation.


fedit
-----
Select files/commits through fzf and edit selected files/commits in `$EDITOR`. Editing commits will perform a interactive rebase.

  - Default: list all tracked files and open `$EDITOR` to edit the selected files. Support multi selection.
  - `-h, --help`: show the help message of `fedit` and exit.
  - `-m, --modified`: list all modified files and open `$EDITOR` to edit the selected files. Support multi selection.
  - `-c, --commit`: list all commits and edit the selected commit through interactive rebase.


flog
----
Interactive log viewer that will prompt you with a menu after selecting a commit. The action menu contains options including edit, reset, revert and checkout the selected commits.

  - Default: list all commits and then prompt menu to select action to perform.
  - `-h, --help`: show the help message of `flog` and exit.
  - `-r, --revert`: revert the selected commit and skip action menu.
  - `-R, --reset`: reset HEAD back to the selected commit and skip action menu.
  - `-e, --edit`: edit selected commit through interactive rebase and skip action menu.
  - `-c, --checkout`: checkout selected commit and skip action menu.
  - `-y, --yes`: acknowledge all actions that will be taken and skip confirmation.


freset
------
Select staged files or commits through fzf and then reset(unstage) staged files or reset HEAD back to certain commits. Also supports reset HEAD back to certain commits using either `--soft`, `--hard`, `--mixed` flags. More information on differences between flags [here](https://git-scm.com/docs/git-reset#Documentation/git-reset.txt-emgitresetemltmodegtltcommitgt).

  - Default: list all staged files and unstage the selected files. Support multi selection.
  - `-h, --help`: show the help message of `freset` and exit.
  - `-c, --commit`: list all commits and then reset HEAD back to the selected commits. (Default: --mixed, put all changes into modified state).
  - `-S, --soft`: use --soft flag instead of --mixed flag, reset HEAD to certain commit without modifying working tree.
  - `-H, --hard`: use --hard flag instead of --mixed flag, reset HEAD to certain commit discard all changes from the working tree.
  - `-y, --yes`: acknowledge all actions that will be taken and skip confirmation.


fstash
------
View and manage stash interactively.

  - Default: list all stashes and apply the selected stash. (Default: `apply`).
  - `-h, --help`: show the help message of `fstash` and exit.
  - `-s, --select`: list modified files and stash the selected files. Support multi selection.
  - `-d, --delete`: list all stashes and delete selected stash. Support multi selection.
  - `-p, --pop`: use `pop` instead of `apply`. (`pop` would remove the stash while `apply` preserve the stash).


fstat
-----
Display interactive git status menu. Toggle file stage/unstage status interactively.

  - `-h, --help`: show the help message of `fstat` and exit.


funtrack
--------
Stop tracking the selected git files. It could also be used to temporarily stop tracking changes for files and then later on resume tracking changes.

**Note**: This command has severe limitations.

By default, selected files are permanently untracked from git. Selected files will be remove from index while keeping the file in your current system. However, when your other machines pull down the changes, the untracked files will be deleted by git. This is a limitation with git.

`funtrack` does come with capabilities to temporarily untrack files, which will not remove the untracked files from other system. However, this is NOT recommended way to untrack files, explained [here](https://www.git-scm.com/docs/git-update-index#_notes).

  - Default: list all tracked files and permanently untrack the selected files. Support multi selection.
  - `-h, --help`: show the help message of `funtrack` and exit.
  - `-t, --temp`: list all tracked files and temporarily untrack changes of the selected files. Support multi selection.
  - `-r, --resume`: list all tracked files and resume tracking changes of the selected files.
  - `-y, --yes`: acknowledge all actions that will be taken and skip confirmation.


fzgrep
------
Grep words within tracked files and select to edit them through fzf. The words are listed as lines in fzf and is separated by columns. First column is the file name, second column is the line number and the third column and beyond are the content of the lines.

  - Default: start searching from 3rd column (excluding the file name and line number during search).
  - `-h, --help`: show the help message of `fstat` and exit.
  - `-c COL, --col COL`: specify the column number to start searching (e.g. `fgrep --col 2`).
  - `-f, --full`: include all column during search, as if using `--col 1`.


Helper scripts
==============

fgit_helper.sh
--------------
Provides variables and functions used by some of the scripts mentioned above.

preview.sh
----------
Fzf preview window coloring.
