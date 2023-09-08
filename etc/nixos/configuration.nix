{ config, pkgs, ... }:

{
  imports =
    [ ./hardware-configuration.nix
      ./wifi-configuration.nix
      ./installed-packages.nix
      ./interactive-shell.nix
      # ./database.nix
    ];

  
  # For UEFI multiple booot
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  # boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  boot.supportedFilesystems = [ "ntfs" ];

  
  networking.hostName = "romashka"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "ru_RU.UTF-8";
  # console = {
  #   font = "cyr-sun16";
  #   keyMap = "ruwin_cplk-UTF-8";
  # };

  # services.xserver.displayManager.sddm.autoNumlock = true;
  # systemd.services.numlock = {
  #   enable = true;
  # };

  
  security.polkit.enable = true; # for ask for you a password when mounting and needs special permissions and gives a nice GUI to type it in
  

  services.xserver = {

    enable = true;
  
    # Enable the GNOME Desktop Environment.
    # # xsession.numlock.enable = true;
    #   displayManager.gdm.enable = true;
    # # displayManager.sddm.autoNumlock = true;
    # desktopManager.gnome.enable = true;


    # Enable the KDE Desktop Environment.
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

   
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
	  dmenu #application launcher most people use  
	  i3status # gives you the default i3 status bar
	  i3lock #default i3 screen locker
	  i3blocks #if you are planning on using i3blocks over i3status
	  feh # add into .i3/config: exec feh --bg-scale /home/dober/W/something.jpg
	  numlockx
      ];
    };
  };



  services.locate.enable = true;

  systemd.user.services.enablenumlock = {
    description = "Enable NumLock on login";
    serviceConfig.PassEnvironment = "DISPLAY";
    script = ''
      numlockx 
    '';
    wantedBy = [ "multi-user.target" ]; # starts after login
  };


  services.redshift = {
    enable = true;
    brightness = {
      # Note the string values below.
      day = "1";
      night = "0.8";
    };
    temperature = {
      day = 5500;
      night = 300;
    };
  };

  location.latitude = 55.75;
  location.longitude = 37.62;
  


  # Configure keymap in X11
  services.xserver = {
    
    layout = "us,ru";
    # xkbVariant = "workman,";
    xkbOptions = "ctrl:nocaps";
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
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;    ## If compatibility with 32-bit applications is desired.
  hardware.pulseaudio.extraConfig = "load-module module-combine-sink";
  nixpkgs.config.pulseaudio = true;


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

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
    extraGroups = [ "wheel" "networkmanager" "vboxusers" "docker" "audio"]; # "wheel" Enable ‘sudo’ for the user.
  };

  nix.settings.trusted-users = [ "root" "kolay" ];


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
    settings.PasswordAuthentication = true;
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


  # ## NVIDIA BEGIN
  #  # Make sure opengl is enabled
  # hardware.opengl = {
  #   enable = true;
  #   driSupport = true;
  #   driSupport32Bit = true;
  # };

  # # # NVIDIA drivers are unfree.
  # # nixpkgs.config.allowUnfreePredicate = pkg:
  # #   builtins.elem (lib.getName pkg) [
  # #     "nvidia-x11"
  # #     "nvidia-settings"
  # #   ];

  # # Tell Xorg to use the nvidia driver
  # services.xserver.videoDrivers = ["nvidia"];

  # hardware.nvidia = {

  #   # Modesetting is needed for most wayland compositors
  #   modesetting.enable = true;

  #   # Use the open source version of the kernel module
  #   # Only available on driver 515.43.04+
  #   open = true;

  #   # Enable the nvidia settings menu
  #   nvidiaSettings = true;

  #   # Optionally, you may need to select the appropriate driver version for your specific GPU.
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };
  # ## END OF NVIDIA
}

