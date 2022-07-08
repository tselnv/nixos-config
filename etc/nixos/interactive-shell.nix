{
  environment.interactiveShellInit = ''
    alias horizon='~/horizon'
    alias echo-nix-shell='echo $IN_NIX_SHELL'
    alias eulerdev="~/MonadFix/euler-tools/euler-bin/euler dev"
    alias docker-remove-all='docker rm -v $(docker ps -aq -f status=exited)'
    alias docker-stop-all='docker stop $(docker ps -q)'
    alias docker-delete-none-images='docker rmi $(docker images -f "dangling=true" -q)'
    HISTSIZE=100000
    HISTFILESIZE=200000
    numlockx on
  '';
  
}
