{
  description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		utils.url = "github:numtide/flake-utils";
	};

  outputs = { self, nixpkgs }@inputs: {
	inputs.utils.lib.eachDefaultSystem (system:
	let
		nixpkgs = inputs.nixpkgs;
		pkgs = import nixpkgs { inherit system; };

	in
	rec {
		devShell = import ./shell.nix { inherit pkgs; };
	});

  };
}
