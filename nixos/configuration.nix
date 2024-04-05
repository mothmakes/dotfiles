# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ lib, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
#   boot.loader.efi.canTouchEfiVariables = true;
#   boot.loader.grub.enable = true;
#   boot.loader.grub.device = "nodev";
#   boot.loader.grub.useOSProber = true;

  networking.hostName = "mothwing"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  fileSystems."/run/media/mothmitcheson/Secondary" =
  { device = "/dev/disk/by-label/Secondary";
    fsType = "ext4";
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  virtualisation = {
    podman = {
      enable = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "workman";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # DISABLE SSH TEMPORARILY UNTIL XZ FIXED
  services.openssh.openFirewall = false;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mothmitcheson = {
    isNormalUser = true;
    description = "Moth Mitcheson";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  home-manager.users.mothmitcheson = { pkgs, ...}: {
    home.packages = with pkgs; [ 
      firefox
      kate
      neovim
      thunderbird
      syncthing
      syncthingtray
      steam
      obsidian
      git
      prismlauncher
      kdePackages.kdenlive
      kdePackages.plasma-browser-integration
      kdePackages.kdeconnect-kde
      kdePackages.kdeplasma-addons
      kdePackages.qtwebengine
      starship
      tmux
      picard
      discord
      jellyfin-media-player
      gh
      ludusavi
      alacritty
      eza
      fzf
      ripgrep
      zoxide
      mc
      openjdk17
      godot_4
      steam-run
      patchelf
      itch
      zotero
      vmware-workstation
      inkscape-with-extensions
      google-fonts
      heroic
      github-desktop
    ];

    programs.git = {
      enable = true;
      userName = "Moth";
      userEmail = "moth@mothmakes.website";
    };

    programs.zsh = {
      enable = true;
      autocd = true;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableCompletion = true;
      shellAliases = {
        ls = "exa";
        ll="exa -alh";
        tree="exa --tree";
        search="rg";
        ff="fzf";
        vim="nvim";
      };
    };

    programs.alacritty = {
      enable = true;
      settings = {
        font.normal.family = "FiraCode Nerd Font";
        font.size = 18.0;
      };
    };

    home.stateVersion = "24.05";
  };

  virtualisation.vmware.host.enable = true;

  programs = {
    neovim.enable = true;
    steam.enable = true;
    starship.enable = true;
    tmux.enable = true;
    zsh.enable = true;
    kdeconnect.enable = true;
  };

  home-manager.useGlobalPkgs = true;

  nixpkgs.config.allowUnfree = true;
  users.defaultUserShell = pkgs.zsh;

  # Set the default applications for various file types
  xdg.mime.defaultApplications = {
    "text/plain" = "org.kde.kate.desktop";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    ivpn
    ivpn-service
    perl538Packages.FileMimeInfo
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
    tailscale
    libreoffice
  ];
  
  fonts.packages = with pkgs; [
    fira-code-nerdfont
  ];

  services.jellyfin.enable = true;
  services.tailscale.enable = true;
  services.ivpn.enable = true;

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
  system.stateVersion = "23.11"; # Did you read the comment?

}
