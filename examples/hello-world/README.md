# Hello world example

This simple example shows how to use `wrangler` with a flake.

It assumes:
- that flakes are enabled in your system - see [here](https://nixos.wiki/wiki/flakes) for more info on this.
- that you have `direnv` installed and set up.

To date, this has only been tested on `x86_64-linux` NixOS systems; we would be
happy to have input from users on other systems.

To run it, simply open a shell in this directory; if `direnv` is active, it 
should ask you to enable `direnv` for this directory. You should see something 
like the following (depending on what shell you use etc):

```shell
🕙 13:03:30 ❯ cd examples/hello-world/
direnv: error /home/sean/Work/wrangler/examples/hello-world/.envrc is blocked. Run `direnv allow` to approve its content
```

Run `direnv allow`:

```shell:
🕙 13:04:02 ❯ direnv allow
direnv: loading ~/Work/wrangler/examples/hello-world/.envrc
direnv: using flake
direnv: nix-direnv: Using cached dev shell
direnv: export +AR +AS +CC +CONFIG_SHELL +CXX +HOST_PATH +IN_NIX_SHELL +LD +NIX_BINTOOLS +NIX_BINTOOLS_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu +NIX_BUILD_CORES +NIX_CC +NIX_CC_WRAPPER_TARGET_HOST_x86_64_unknown_linux_gnu +NIX_CFLAGS_COMPILE +NIX_ENFORCE_NO_NATIVE +NIX_HARDENING_ENABLE +NIX_LDFLAGS +NIX_STORE +NM +OBJCOPY +OBJDUMP +RANLIB +READELF +SIZE +SOURCE_DATE_EPOCH +STRINGS +STRIP +__structuredAttrs +buildInputs +buildPhase +builder +cmakeFlags +configureFlags +depsBuildBuild +depsBuildBuildPropagated +depsBuildTarget +depsBuildTargetPropagated +depsHostHost +depsHostHostPropagated +depsTargetTarget +depsTargetTargetPropagated +doCheck +doInstallCheck +dontAddDisableDepTrack +mesonFlags +name +nativeBuildInputs +out +outputs +patches +phases +preferLocalBuild +propagatedBuildInputs +propagatedNativeBuildInputs +shell +shellHook +stdenv +strictDeps +system ~PATH ~XDG_DATA_DIRS
```

This should run `flake.nix` to create a development shell which contains the latest version 
of `wrangler`; this will create a `flake.lock` file in the current directory which you can 
commit if you like - if you commit this, then you are pinning the `wrangler` version until 
you perform `nix flake update`. You can use `wrangler` directly from the command line as 
follows:

```shell
🕙 13:05:19 ✖  wrangler --version

 ⛅️ wrangler 3.67.1
-------------------
```

To run the hello-world application locally:

```shell
🕙 13:05:22 ❯ wrangler dev

 ⛅️ wrangler 3.67.1
-------------------

[wrangler:inf] Ready on http://localhost:8989
⎔ Starting local server...
╭─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ [b] open a browser, [d] open Devtools, [l] turn off local mode, [c] clear console, [x] to exit                                                              │
╰─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

Point your browser at `http://localhost:8989` to see the simple web page served
by the worker running locally.

## Updating to a newer version of `wrangler`

If you use the github url for `wrangler`, you should simply be able to run `nix
flake update`: this will check if there have been any updates to this github
repo and update `flake.lock` and `wrangler` accordingly.

If you're using the flakehub link for `wrangler`, you will need to update the 
link in the `flake.nix` file to use the latest version.

## Adding this to an existing project

To add this functionality to an existing project which uses `wrangler`, simply 
copy the `.envrc` and `flake.nix` files and amend as necessary. You will probably 
have to add some extra files and directories to your `.gitignore` if you enable 
this for the first time within the project.
