# Cloudflare Workers Wrangler SDK Flake
Packaged Cloudflare Wrangler SDK in a Nix flake.

## Usage

### Nixpkgs
The wrangler package is bundled in with nixpkgs already, but updates are monthly.

### With Flake
Get the recent release of wrangler from FlakeHub in your flake inputs:
```nix
{
  inputs.wrangler.url = "https://flakehub.com/f/ryand56/wrangler/*.tar.gz";

  outputs = { self, wrangler }: {
    # Use in your outputs
  };
}
```
The flake version of wrangler will be updated more frequently.

## Maintainers

- [dezren39](https://github.com/dezren39)
- [seanrmurphy](https://github.com/seanrmurphy)
- [ryand56](https://github.com/ryand56)