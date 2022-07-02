Nix Flakes
=============

Nix claims the reproducibility, but actually it is usually not the case:
- Nix can access arbitrary control files from different machines, for example,
    - ``~/.config/nixpkgs/config.nix``
    - Nix search path such as ``NIX_PATH``
- Also, when we use `GitFetch` etc. to get the 3rd party libarary, it's difficult to absolutely make sure that the versions we get 
are the same from different builds.

Flakes are a solution to these problems. 

A flake is simply a source tree (such as a Git repository) containing a file named flake.nix, which provides a 
standardized interface to Nix packages.

Setup Nix Flakes
***********
