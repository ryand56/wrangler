{
  description = "Wrangler, the CLI for Cloudflare Workers, packaged as a nix flake";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forEachSupportedSystem =
        f: nixpkgs.lib.genAttrs supportedSystems (system: f { pkgs = import nixpkgs { inherit system; }; });
    in
    {
      packages = forEachSupportedSystem (
        { pkgs }:
        rec {
          wrangler = pkgs.callPackage ./pkgs/wrangler/package.nix { };
          default = wrangler;
        }
      );

      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShell { packages = with pkgs; [ nixfmt-rfc-style ]; };
        }
      );

      checks =
        let
          packages = self.packages;
          devShells = self.devShells;
        in
        nixpkgs.lib.recursiveUpdate packages { } // nixpkgs.lib.recursiveUpdate devShells { };
    };
}
