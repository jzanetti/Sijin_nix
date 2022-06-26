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

   - | Set the environment variable ``XDG_CONFIG_HOME``, e.g.,
     |   ``export XDG_CONFIG_HOME=/home/szhang/.config``
   - | Edit ``$XDG_CONFIG_HOME/nix/nix.conf`` (we may need to create one if it does not exist) 
       and add the line ``experimental-features = nix-command flakes``.
     |   Note that by doing this we switch on the unstable version of **nix**,
         in order to keep using the stable version, we need to specify ``nixpkg`` in our future nix command, e.g., ``nix search nixpkgs emacs``
         instead of ``nix search emacs``


Use nix
------
.. list-table:: Packages
   :widths: 30 40 60
   :header-rows: 1

   * - Description
     - Command
     - Example
   * - Install a package
     - ``nix-env -i <pkg>`` or ``nix-env -iA <channel>.<pkg>``
     - ``nix-env -i hello`` or ``nix-env -iA nixpkgs.hello``
   * - Remove a package
     - ``nix-env -e <pkg>`` 
     - ``nix-env -e hello``
   * - Upgrade a package
     - ``nix-env --upgrade <pkg>`` 
     - ``nix-env --upgrade hello`` 
   * - Query installed packages
     - ``nix-env --query <pkg>`` 
     - ``nix-env --query hello`` or ``nix-env --query "*"``
   * - Search a package
     - ``nix search <channel> <pkg>`` 
     - ``nix search nixpkgs hello``

.. list-table:: Channels (`all nix channels <https://channels.nixos.org/>`_)
   :widths: 30 40 60
   :header-rows: 1

   * - Description
     - Command
     - Example
   * - List existing channels
     - ``nix-channel --list`` 
     - N/A
   * - Add a new channel
     - - ``nix-channel --add <channel_link> <channel_name>``
       - nix-channel --update`` 
     - - ``nix-channel --add https://nixos.org/channels/nixos-19.03 nixpkgs``
       - ``nix-channel --update``
   * - Remove a channel
     - - ``nix-channel --remove <channel_name>``
       - ``nix-channel --update`` 
     - - ``nix-channel --remove https://nixos.org/channels/nixos-19.03 nixpkgs``
       - ``nix-channel --update``


.. list-table:: Build (used to build a package defined with the Nix Expression Language)
   :widths: 30 40 60
   :header-rows: 1

   * - Description
     - Command
     - Example
   * - build a package
     - ``nix-build '<channel name>' -A <pkg>`` 
     - ``nix-build '<nixpkgs>' -A <hello>``
         - building the hello package from the nixpkgs channel
         - The resulting package is build and added to the nix store. 
            e.g., a link pointing to the package that has been put 
            into the store is created in ``./result/bin/hello``
      

Reference
------
- https://rgoswami.me/posts/ccon-tut-nix/

- https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/getting-started.html

