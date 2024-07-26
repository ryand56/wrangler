{
  description = "A simple flake which shows how to use nix-packaged wrangler";

  inputs = {
    # Nixpkgs / NixOS version to use.
    nixpkgs.url = "nixpkgs/nixos-24.05";

    # this can be pinned to a specific flakehub version as follows:
    #
    # wrangler-flake.url = "https://flakehub.com/f/ryand56/wrangler/0.2.1.tar.gz"
    #
    # if it points to github, then running `nix flake update` will just get the 
    # latest version from github and update wrangler as necessary.
    wrangler-flake.url = "github:ryand56/wrangler";
  };

  outputs =
    {
      self,
      nixpkgs,
      wrangler-flake,
    }:
    let
      # System types to support.
      supportedSystems = [ "x86_64-linux" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system types.
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });

    in
    {
      # Add dependencies that are only needed for development
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgsFor.${system};
        in
        {
          default = pkgs.mkShell {
            packages = [
              # it's possible to add this package as an override to nixpkgs; here it's just 
              # added directly...
              wrangler-flake.packages.${system}.wrangler
              pkgs.cowsay # this is just included as an example of a package import from nixpkgs - include here any packages you require
            ];
          };
        }
      );
    };
}
