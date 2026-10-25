{
  description = "NixOS System Configuration with Flakes";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    #antigravity-nix = {
    #  url = "github:jacopone/antigravity-nix";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
   
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };

        modules = [
          ./hardware-configuration.nix
          ./configuration.nix
          
          # Módulo do Home Manager
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              
              useGlobalPkgs = true;
              useUserPackages = true;
              
              backupFileExtension = "backup";
              overwriteBackup = true;          
  
              users.hikari = import ./home.nix;
            };
          }
        ];
      };
    };
  };
}
