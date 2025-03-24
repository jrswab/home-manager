{ config, pkgs, ... }:

{
  home.username = "jaron";
  home.homeDirectory = "/home/jaron";
  home.stateVersion = "24.11";

  home.packages = [
		pkgs.zsh
		pkgs.tmux
		pkgs.neovim

		pkgs.brave
		pkgs.thunderbird
		# pkgs.syncthing # needs nixOS system ability
  ];

  home.file = {
		# name = {}
		# Where name is the path of the target directory/file(s)
		# If name is not the target path "target = path;" must be added

		# Since my Neovim is large, just load the config from the present directory:
		".config/nvim" = {
			source = ./nvim;
			recursive = true;
			#target = /home/jaron/.config/nvim;
		};

		# pkgs.tmuxPlugins does not have everforest so load from seprate config:
		".config/tmux" = {
			source = ./tmux;
			recursive = true;
			#target = /home/jaron/.config/tmux;
		};

		".zshrc" = {
			source = ./zshrc;
		};
  };

  # These will be explicitly sourced when using a shell provided by Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
		XDG_CONFIG_HOME = "$HOME/.config";
		XDG_CACHE_HOME = "$HOME/.cache";
		XDG_DATA_HOME = "$HOME/.local/share";
		SSH_KEY_PATH = "$HOME/.ssh/id_ed25519";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

	# Let Home Manager configure Git.
	programs.git = {
    enable = true;
    userName = "Jaron Swab";
    userEmail = "jr@jrswab.com";
  };
}
