{
  description = "Wrangler, the CLI for Cloudflare Workers, packaged as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }:
      {
        systems = [ "x86_64-linux" ];

        perSystem =
          {
            self',
            pkgs,
            system,
            ...
          }:
          rec {
            packages = rec {
              wrangler = pkgs.callPackage ./pkgs/wrangler/package.nix { };
              default = wrangler;
            };

            devShells = {
              default = pkgs.mkShell { packages = [ pkgs.nixfmt-rfc-style ]; };
            };

            checks = packages // devShells;
          };
      }
    );
}
