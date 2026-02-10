{...}: {
  languages.javascript = {
    enable = true;
    npm.enable = true;
  };

  scripts = let
    move-to-project-folder = ''
      relative_path="''${PWD#$DEVENV_ROOT/}"
      project_name="''${relative_path%%/*}"
      cd $DEVENV_ROOT/$project_name
    '';
  in {
    quartz-preview.exec = ''
      ${move-to-project-folder}
      npx quartz build --serve
    '';
    quartz-sync.exec = ''
      ${move-to-project-folder}
      npx quartz sync
    '';
  };
}
