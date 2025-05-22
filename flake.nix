{
  description = "Wrangler, the CLI for Cloudflare Workers, packaged as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
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
        systems = [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ];

        perSystem =
          {
            self',
            pkgs,
            system,
            ...
          }:
          rec {
            formatter = pkgs.nixfmt-rfc-style;

            packages = rec {
              wrangler = pkgs.callPackage ./pkgs/wrangler/package.nix { };
              default = wrangler;
            };

            devShells = {
              default = pkgs.mkShell {
                packages = [
                  pkgs.nixfmt-rfc-style
                  pkgs.nodejs
                  pkgs.pnpm
                ];
              };
            };

            checks = packages // devShells;
          };
      }
    );
}
