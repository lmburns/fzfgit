0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
_path="${0:h}"

if [[ -z "${path[(r)$_path]}" ]]; then
  path+=( "${_path}" )
fi

__fzfgit_completion() {
  local context state state_descr line ret curcontext
  local -A opt_args
  ret=1
  curcontext="${curcontext}"

  _arguments -C \
    '(- : *)'{-h,--help}'[show help information]' \
    '(- : *)'{-v,--version}'[display fzfgit version]' \
    '(-g --git)'{-g,--git}'[use fzfgit as a generic fuzzy git tool and operate in current git directory]' \
    '1:cmds:->cmds' \
    '*::options:->options' \
    && ret=0

  case "${state}" in
    cmds)
      local subcommands
      subcommands=(
        'fadd:stage files'
        'fbackup:backup files'
        'fcheckout:checkout file/branch/commit'
        'fedit:edit files'
        'fzgrep:grep within tracked files'
        'flog:interactive log viewer'
        'freset:reset files/commit'
        'fstash:stage management'
        'fstat:toggle stage/unstage of files'
        'funtrack:untrack files'
        'fupgrade:update fzfgit'
      )
      _describe 'command' subcommands \
        && ret=0
      ;;
    options)
      case "${line[1]}" in
        fadd)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-f --file -d --dir -h --help)'{-f,--file}'[select files from PWD and stage]' \
            '(-d --dir -f --file -h --help)'{-d,--dir}'[select directory from PWD and stage]' \
            && ret=0
        ;;
        fbackup)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-s --select -p --path -h --help)'{-s,--select}'[select tracked files to backup]' \
            '(-p --path -s --select -h --help)'{-p,--path}'[sepcify path of files to backup]:filename:_files' \
            '(-m --move -h --help)'{-m,--move}'[use mv cmd instead of cp cmd]' \
            && ret=0
          ;;
        fcheckout)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-s --select -b --branch -c --commit -h --help)'{-s,--select}'[select files and then checkout them in selected commits]' \
            '(-b --branch -s --select -c --commit -h --help)'{-b,--branch}'[checkout branch]' \
            '(-c --commit -b --branch -s --select -h --help)'{-c,--commit}'[checkout commit]' \
            '(-y --yes -h --help)'{-y,--yes}'[acknowledge all actions and skip confirmation]' \
            && ret=0
          ;;
        fedit)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-m --modified -c --commit -h --help)'{-m,--modified}'[edit modified files]' \
            '(-c --commit -m --modified -h --help)'{-c,--commit}'[edit commits]' \
            && ret=0
          ;;
        fzgrep)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-f --full -c --col)'{-f,--full}'[include all columns during fzf search, as if using "--col 1"]' \
            '(-f --full -c --col)'{-c,--col}'[specify a column number to start searching in fzf]: :->cols' \
            && ret=0
          ;;
        flog)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-r --revert -R --reset -e --edit -c --checkout -h --help)'{-r,--revert}'[revert the selected commit and skip action menu]' \
            '(-r --revert -R --reset -e --edit -c --checkout -h --help)'{-R,--reset}'[reset the selected commit and skip action menu]' \
            '(-r --revert -R --reset -e --edit -c --checkout -h --help)'{-e,--edit}'[edit the selected commit and skip action menu]' \
            '(-r --revert -R --reset -e --edit -c --checkout -h --help)'{-c,--checkout}'[checkout the selected commit and skip action menu]' \
            '(-y --yes -h --help)'{-y,--yes}'[acknowledge all actions and skip confirmation]' \
            && ret=0
          ;;
        freset)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-c --commit -h --help)'{-c,--commit}'[reset HEAD to certain commit]' \
            '(-S --soft -H --hard -h --help)'{-S,--soft}'[reset commit using --soft flag]' \
            '(-H --hard -S --soft -h --help)'{-H,--hard}'[reset commit using --hard flag]' \
            '(-y --yes -h --help)'{-y,--yes}'[acknowledge all actions and skip confirmation]' \
            && ret=0
          ;;
        fstash)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-s --select -d --delete -p --pop -h --help)'{-s,--select}'[list modified files and stash the selected files]' \
            '(-s --select -d --delete -p --pop -h --help)'{-d,--delete}'[list stash and delete the selected stash]' \
            '(-s --select -d --delete -p --pop -h --help)'{-p,--pop}'[use "stash pop" instead of "stash apply"]' \
            && ret=0
          ;;
        fstat)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            && ret=0
          ;;
        funtrack)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            '(-t --temp -r --resume -h --help)'{-t,--temp}'[temporarily ignore changes of the selected files]' \
            '(-t --temp -r --resume -h --help)'{-r,--resume}'[resume tracking changes of the selected files]' \
            '(-y --yes -h --help)'{-y,--yes}'[acknowledge all actions and skip confirmation]' \
            && ret=0
          ;;
        fupgrade)
          _arguments \
            '(- : *)'{-h,--help}'[show help information]' \
            && ret=0
          ;;
        *)
          _normal
          ;;
      esac
      ;;
  esac

  return "${ret}";
}

_fzfgit_completion_cmd() {
  local compdef_name="fzfgit"
  compdef __fzfgit_completion "${compdef_name}"
}

_fzfgit_completion_git() {
  local compdef_name="fzfgit"
  compdef "${compdef_name}"=git
}

_widget_fzfgit_fadd() { fadd; }
_widget_fzfgit_fedit() { fedit; }
_widget_fzfgit_fcheckout() { fcheckout; }
_widget_fzfgit_freset() { freset; }
_widget_fzfgit_flog() { flog; }
_widget_fzfgit_fzgrep() { fzgrep; }
_widget_fzfgit_fstat() { fstat; }

zle -N fzfgit-fadd _widget_fzfgit_fadd
zle -N fzfgit-fedit _widget_fzfgit_fedit
zle -N fzfgit-fcheckout _widget_fzfgit_fcheckout
zle -N fzfgit-freset _widget_fzfgit_reset
zle -N fzfgit-flog _widget_fzfgit_flog
zle -N fzfgit-fzgrep _widget_fzfgit_fzgrep
zle -N fzfgit-fstat _widget_fzfgit_fstat
