{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.oh-my-posh = {
    enable = true;
    useTheme = "atomic";
    enableBashIntegration = true;
  };
}