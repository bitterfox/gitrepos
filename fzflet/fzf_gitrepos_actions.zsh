#!/bin/zsh

fzflet_gitrepos_basedir=`dirname $0`

GITREPOS_CATEGORY=299

fzf_gitrepos_category_name() {
    echo "git-repos"
}

fzf_gitrepos_goto_action() {
    priority=$1
    description=$2

    project=`$fzflet_gitrepos_basedir/../git-repos list | fzf --tiebreak=index`
    if [ -n "$project" ]; then
        $fzflet_gitrepos_basedir/../git-repos count "$project"
        cd "`gr root`/$project"
        zle fzf-redraw-prompt
    fi
}

fzf_gitrepos_goto_action_category_name() {
    fzf_gitrepos_category_name
}

fzf_gitrepos_goto_action_priorities() {
    echo $GITREPOS_CATEGORY
}

fzf_gitrepos_goto_action_descriptions() {
    echo "Go to git-repos"
}
