alias gr="git-repos"

function _git_repos_list {
  local -a repos

  repos=( $( git-repos list ) )

  compadd $repos

  return 1;
}

compdef _git_repos_list git-repos
compdef _git_repos_list gr
