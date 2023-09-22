{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super:
    {
   zoomUsFixed = pkgs.zoom-us.overrideAttrs (old: {
      postFixup = old.postFixup + ''
        wrapProgram $out/bin/zoom-us --unset XDG_SESSION_TYPE
      '';});
   zoom = pkgs.zoom-us.overrideAttrs (old: {
      postFixup = old.postFixup + ''
        wrapProgram $out/bin/zoom --unset XDG_SESSION_TYPE
      '';});
      }
      )
  ];
  # install pkgs.zoom, not pkgs.zoom-us
  # and add "enableWaylandShare=true" to ~/.config/zoomus.conf

  # environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  #   elisa
  #   gwenview
  #   okular
  #   oxygen
  #   khelpcenter
  #   konsole
  #   plasma-browser-integration
  #   print-manager
  # ];


  environment.systemPackages = with pkgs; [
         ## NVIDIA
         # linuxKernel.packages.linux_zen.nvidia_x11_production
    
         ## GNOME
	 # remmina
	 # evince # pdf reader
	 # gnome.dconf-editor

	 ## KDE
	 libsForQt5.elisa
	 libsForQt5.gwenview
	 libsForQt5.okular
	 libsForQt5.oxygen
	 libsForQt5.khelpcenter
	 libsForQt5.konsole
	 libsForQt5.plasma-browser-integration
	 libsForQt5.print-manager
	 libsForQt5.konsole
	 libsForQt5.krdc

         pasystray # audio control applet
	 pavucontrol # volume contol
	 networkmanager_dmenu # wi-fi applet
         firefox
	 
         thunderbird
         emacs
	 vscode
	 libreoffice
	 keepassxc
	 openvpn
	 filelight
	 tree # show files in directory as tree
	 
	 docker
	 postgresql
	 redis
	 dbeaver
	 pgsync # pg_dump and other utilities
	 
	 mc
	 ranger	 
         wget
	 git	
	 
	 unrar
	 p7zip
	 bchunk # bin cue to iso, example: bchunk -v JUTLAND.bin JUTLAND.cue Jutland
	 efibootmgr
	 zoom
	 qbittorrent
	 vlc
	 vmware-horizon-client
	 oath-toolkit ## Google authentification
	 numlockx
	 gimp
	 
	 dosbox
	 wine
	 wine64
	 winetricks
	 ccd2iso # convert img to iso
	 ecmtools # convert ecm to iso
	 openttd
	 redshift
	 pciutils # A collection of programs for inspecting and manipulating configuration of PCI devices
	 gdu # disk usage analizer
	 
	 electrum
	 feh # add into .i3/config: exec feh --bg-scale /home/dober/W/something.jpg


	 ## OTHER
	 # chromium
	 
	 # stack
	 # ghc
	 # ghcid
	 # cabal-install
	 # hpack

	 # racket
	 
	 # coq
	 # opam
	 # coqPackages.mathcomp-ssreflect

	 # joplin-desktop
	 # arcan.ffmpeg
	 # virtualbox

	 # mycrypto

	 #  hamster
	 #  gtimelog
	 #  toggldesktop
	 #  gtimelog
	 #  timewarrior	
    ];
}
