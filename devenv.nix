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
    # Build and preview locally
    preview.exec = ''
      ${move-to-project-folder}
      npx quartz build --serve
    '';

    # Sync with Repository
    sync.exec = ''
      ${move-to-project-folder}
      npx quartz sync
    '';

    # Build and sync to show it in Github Pages
    build.exec = ''
      ${move-to-project-folder}
      npx quartz build
      npx quartz sync
    '';
  };
}
