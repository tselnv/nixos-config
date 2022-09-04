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


  environment.systemPackages = with pkgs; [
         pasystray # audio control applet
	 pavucontrol # volume contol
	 networkmanager_dmenu # wi-fi applet
         firefox
	 chromium
         thunderbird
         emacs
	 vscode
	 libreoffice
	 keepassxc
	 evince
	 stack
	 ghc
	 ghcid
	 cabal-install
	 hpack
	 docker
	 postgresql
	 redis
	 dbeaver
	 pgsync # pg_dump and other utilities
	 # coq
	 # opam
	 # coqPackages.mathcomp-ssreflect
	 mc
	 ranger
	 joplin-desktop
         wget
	 git	
	 pciutils
	 unrar
	 p7zip
	 bchunk # bin cue to iso, example: bchunk -v JUTLAND.bin JUTLAND.cue Jutland
         gnome.dconf-editor
	 efibootmgr
	 zoom
	 qbittorrent
	 vlc
	 vmware-horizon-client
	 numlockx
	 gimp
	 arcan.ffmpeg
	 virtualbox
	 dosbox
	 wine
	 wine64
	 ccd2iso # convert img to iso
	 ecmtools # convert ecm to iso
	 openttd
	 redshift
	 racket
	 electrum
	 mycrypto
	 feh # add into .i3/config: exec feh --bg-scale /home/dober/W/something.jpg
	 
	#  hamster
	#  gtimelog
	#  toggldesktop
	#  gtimelog
	#  timewarrior	
    ];
}
