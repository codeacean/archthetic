{
	description = "NixOS :: All Flakes";

	inputs = {
	    nixpkgs.url = "nixpkgs/nixos-unstable";

	    home-manager = {
		    url = "github:nix-community/home-manager";
		    inputs.nixpkgs.follows = "nixpkgs";
	    };

      nix-flatpak = {
        url = "github:gmodena/nix-flatpak";
        inputs.nixpkgs.follows = "nixpkgs";
      };

	    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        inputs = {
            nixpkgs.follows = "nixpkgs";
            home-manager.follows = "home-manager";
        };
	    };

	    noctalia = {
	      url = "github:noctalia-dev/noctalia-shell";
	      inputs.nixpkgs.follows = "nixpkgs";
	      inputs.noctalia-qs.follows = "noctalia-qs";
	    };

	    noctalia-qs = {
	      url = "github:noctalia-dev/noctalia-qs";
	      inputs.nixpkgs.follows = "nixpkgs";
	    };
	};

	outputs = { self, nixpkgs, home-manager, nix-flatpak, zen-browser, ... } @ inputs: 
	  {
	    nixosConfigurations.nixie = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./appearence.nix
          ./bootloader.nix
          ./configuration.nix
          ./dev.nix
          ./flatpak.nix
          ./graphical.nix
          ./hyprland.nix
          ./programs.nix
          ./settings.nix
          ./services.nix
          ./security.nix
          ./module/noctalia.nix

          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.rafid = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
	  };
	};
}
