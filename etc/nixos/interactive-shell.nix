{
  environment.interactiveShellInit = ''
    alias horizon='~/horizon.sh'
    alias echo-nix-shell='echo $IN_NIX_SHELL'
    alias eulerdev="~/MonadFix/euler-tools/euler-bin/euler dev"
    alias docker-remove-all='docker rm -v $(docker ps -aq -f status=exited)'
    alias docker-stop-all='docker stop $(docker ps -q)'
    alias docker-delete-none-images='docker rmi $(docker images -f "dangling=true" -q)'
    HISTSIZE=100000
    HISTFILESIZE=200000
    GOPATH=$HOME/gocode
    numlockx on
    alias vpn='sudo openvpn --config /home/kolay/my/lapochka.ovpn'
    alias kdelogout='qdbus org.kde.ksmserver /KSMServer logout 0 0 2'
    alias timeweb='ssh -i .ssh/timeweb kolay@95.140.155.123'
    alias ll='ls -al'
  '';
  
}
