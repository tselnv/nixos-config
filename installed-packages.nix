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
         firefox
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
	 mc
	 ranger
	 joplin-desktop
         wget
	 git	
	 pciutils
	 unrar
	 bchunk
         gnome.dconf-editor
	 efibootmgr
	 zoom
	 qbittorrent
	 vlc
	 vmware-horizon-client
	 virtualbox
	 dosbox
	 wine
	 wine64
	 ccd2iso
	 openttd
	#  hamster
	#  gtimelog
	#  toggldesktop
	#  gtimelog
	#  timewarrior	
    ];
}
