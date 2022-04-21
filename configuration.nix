# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./wifi-configuration.nix
    ];

  
  # For UEFI multiple booot
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  # boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  boot.supportedFilesystems = [ "ntfs" ];

  # Use the GRUB 2 boot loader.
  # boot.loader.systemd-boot.enable = true;  
  # boot.loader.grub.enable = true;
  # boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  
  
  networking.hostName = "romashka"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # i18n.defaultLocale = "ru_RU.UTF-8";
  # console = {
  #   font = "cyr-sun16";
  #   keyMap = "ruwin_cplk-UTF-8";
  # };


  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  


  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver = {
    enable = true;
    layout = "us,ru";
    # xkbVariant = "workman,";
    # xkbOptions = "grp:win_space_toggle";
    # xkbOptions = "caps:swapescape,grp:rctrl_rshift_toggle";
    # xkbOptions = "grp:alt_lshift_toggle";
    # xkbOptions = "ctrl:swapcaps"; # use CapsLock as Ctrl
  };
  # via dconf-editor set org.gnome.desktop.wm.keybindings = ['<Super>space', '<Alt>Shift_L', 'XF86Keyboard']

  # Then run these commands:
  # gsettings reset org.gnome.desktop.input-sources xkb-options
  # gsettings reset org.gnome.desktop.input-sources sources
  # Now reboot

  # Change CapsLock to Ctrl
    # run dconf-editor
    # select org.gnome.desktop.input-sources
    # Change xkb-options to ['ctrl:nocaps'] (or add it to any existing options)


  # services.xserver.desktopManager.gnome = {
  #   extraGSettingsOverridePackages = with pkgs; [ gnome3.gnome-settings-daemon ];
  #   extraGSettingsOverrides = ''
  #     [org.gnome.settings-daemon.plugins.media-keys]
  #     custom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']


  #     [org.gnome.settings-daemon.plugins.media-keys.custom-keybindings.custom0]
  #     binding='<Super>t'
  #     command='gnome-terminal'
  #     name='Open terminal'
  #   '';
  # };




  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # for VirtualBOX
  # Run VirtualBOX: /run/wrappers/wrappers.gtG1GDCvm0/VirtualBoxVM --startvm winxp
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  # nixpkgs.config.virtualbox.enableExtensionPack = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  virtualisation.docker.enable = true;

  users.users.kolay = {
    isNormalUser = true;
    home = "/home/kolay";
    extraGroups = [ "wheel" "networkmanager" "vboxusers" "docker"]; # "wheel" Enable ‘sudo’ for the user.
    # extraGroups = [ "wheel" "networkmanager" "docker" ]; # "wheel" Enable ‘sudo’ for the user.
  };

  nix.trustedUsers = [ "root" "kolay" ];


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #   wget
  #   firefox
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  services.openssh = {
    enable = true;
    passwordAuthentication = true;
  #  permitRootLogin = "yes";
  #  challengeResponseAuthentication = false;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

  environment.interactiveShellInit = ''
    alias horizon='~/horizon'
    alias echo-nix-shell='echo $IN_NIX_SHELL'
    alias eulerdev="~/MonadFix/euler-tools/euler-bin/euler dev"
    alias docker-remove-all='docker rm -v $(docker ps -aq -f status=exited)'
    alias docker-stop-all='docker stop $(docker ps -q)'
    alias docker-delete-none-images='docker rmi $(docker images -f "dangling=true" -q)'
    HISTSIZE=100000
    HISTFILESIZE=200000
  '';


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
  

  environment.systemPackages =
      [ pkgs.firefox
        pkgs.thunderbird
        pkgs.emacs
	pkgs.vscode
	pkgs.libreoffice
	pkgs.keepassxc
	pkgs.evince
	pkgs.stack
	pkgs.ghc
	pkgs.ghcid
	pkgs.cabal-install
	pkgs.hpack
	pkgs.docker
	pkgs.mc
	pkgs.ranger
	pkgs.joplin-desktop
        pkgs.wget
	pkgs.git	
	pkgs.pciutils
	pkgs.unrar
	pkgs.bchunk
        pkgs.gnome.dconf-editor
	pkgs.efibootmgr
	pkgs.zoom
	pkgs.qbittorrent
	pkgs.vlc
	pkgs.vmware-horizon-client
	pkgs.virtualbox
	pkgs.dosbox
	pkgs.wine
	pkgs.wine64
	pkgs.ccd2iso
	pkgs.openttd
	# pkgs.hamster
	# pkgs.gtimelog
	# pkgs.toggldesktop
	# pkgs.gtimelog
	# pkgs.timewarrior	
      ];
}

