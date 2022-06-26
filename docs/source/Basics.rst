Basics
=====

This page records some useful basic concepts and commands for **nix** 

.. note::

   - **Nix derivation**: A derivation in Nix is a definition of a build, which takes some inputs and produces an output (in other words, the derivation is a function that describes a build process )

Install nix
------
**nix** can be installed using the following command

.. code-block:: bash

   sh <(curl -L https://nixos.org/nix/install) --daemon

.. note::

   We may need to configure **nix** accordingly to use all of its features, e.g.,

   - set the environment variable ``XDG_CONFIG_HOME``, e.g., 
         | ``export XDG_CONFIG_HOME=/home/szhang/.config``
   - | edit ``$XDG_CONFIG_HOME/nix/nix.conf`` (we may need to create one if it does not exist) 
       and add the line ``experimental-features = nix-command flakes``.

         | Note that by doing this we switch on the unstable version of **nix**,
           in order to keep using the stable version, we need to specify ``nixpkg`` in our future nix command, e.g., ``nix search nixpkgs emacs``
           instead of ``nix search emacs``

