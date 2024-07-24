# Cloudflare Workers Wrangler SDK Flake
Packaged Cloudflare Wrangler SDK in a Nix flake.

## Usage
### With Flake
Get the recent release from FlakeHub in your flake inputs:
```nix
{
  inputs.wrangler.url = "https://flakehub.com/f/ryand56/wrangler/*.tar.gz";

  outputs = { self, wrangler }: {
    # Use in your outputs
  };
}
```