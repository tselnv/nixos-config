{ config, pkgs, ... }:

{

  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  boot.kernelModules = [ "wl" ];
  boot.blacklistedKernelModules = [ "b43" 
                                    "bcma"
                                    "b43legacy" 
                                    "ssb" 
                                    "tg3" ];

}
 #needs for tp link archer te6 (WI1 chip1: Broadcom BCM4352)