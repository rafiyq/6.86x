# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-24.05"; # or "unstable"
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.micromamba
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "ms-python.python"
      "ms-python.debugpy"
    ];
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        create-env = ''
          micromamba shell init --shell bash --root-prefix=~/micromamba
          micromamba create -f env.yml -y
        '';
      };
      # Run something each time the workspace is (re)started
      onStart = {
        create-env = ''
          micromamba activate 6.86x
        '';
      }
    };
    # Enable previews and customize configuration
    previews = {};
  };
}
