{
  description = "Wrangler, the CLI for Cloudflare Workers, packaged as a nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    supportedSystems = [ "x86_64-linux" ];
    forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
      pkgs = import nixpkgs { inherit system; };
    });
  in {
    packages = forEachSupportedSystem ({ pkgs }: rec {
      wrangler = pkgs.callPackage ./pkgs/wrangler/package.nix { };
      default = wrangler;
    });
  };
}
