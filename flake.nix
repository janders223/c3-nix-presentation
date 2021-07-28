{
  description = "Nix Presentation";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  inputs.utils.lib.eachDefaultSystem (system:
  let
    pkgs = import nixpkgs { inherit system; config = {
      allowBroken = true; };
    };
  in
  {
    devShell = import ./shell.nix { inherit pkgs; };
  });
}
