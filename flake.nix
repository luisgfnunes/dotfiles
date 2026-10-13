{
  description = "NixOS System Configuration with Flakes";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    umbriel = {
      url = "github:noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
   
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, disko, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };

        modules = [
          inputs.disko.nixosModules.disko
          inputs.umbriel.nixosModules.default
          ./disko-config.nix
          ./hardware-configuration.nix
          ./configuration.nix
          
          # Módulo do Home Manager
          home-manager.nixosModules.home-manager
          {
            # Bloco de configuração do Home Manager
            home-manager = {
              extraSpecialArgs = { inherit inputs; };
              
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              # Importa a configuração pessoal
              users.blue = import ./noctalia-config.nix;
            };
          }
        ];
      };
    };
  };
}
