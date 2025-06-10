{
  config,
  lib,
  pkgs ? import <nixpkgs>,
  ...
}:
{
  nixGL.packages = import <nixgl> { inherit pkgs; };
  home = {
    username = "garicas";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.05";
    activation = {
      fzf-tab-check = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        run mkdir -p ${config.programs.zsh.oh-my-zsh.custom}/plugins
        run test -d ${config.programs.zsh.oh-my-zsh.custom}/plugins/fzf-tab || ${pkgs.git}/bin/git clone https://github.com/Aloxaf/fzf-tab ${config.programs.zsh.oh-my-zsh.custom}/plugins/fzf-tab
      '';
    };

    packages = (
      with pkgs;
      [
        yt-dlp
        ffmpeg_6-full
        protonup-qt
        hyprshot
        # android-tools
        bash-language-server
        # cachix
        # c3c
        # llvmPackages_19.clang-tools
        # clojure
        # csharpier
        # cmake
        # ansible
        # dockfmt
        sbcl
        coq
        # pe-bear
        # wxhexeditor
        # intentrace
        # containerd
        # coursier
        # crosvm
        # curl
        delta
        devenv
        binwalk
        bat
        # discord
        # docker
        # docker-buildx
        # docker-compose
        # deno
        fastfetch
        neofetch
        # file
        # firecracker
        # firectl
        # flintlock
        glibc
        # gtk2
        # gtk2-x11
        # gtk3
        # gtk3-x11
        # gomodifytags
        # gore
        # gnumake
        # gparted
        # kdiskmark
        # luajit
        lua-language-server
        # metals
        # nerdctl
        # nerdfonts
        # ninja
        # nix-snapshotter
        nix-zsh-completions
        nil
        # marksman
        # nodejs
        # openfga-cli
        # opentofu
        # openssl
        # pinentry-tty
        pinentry-curses
        # pinentry-rofi
        # python312Full
        # qbe
        # rpi-imager
        shfmt
        shellcheck
        remmina
        rustup
        # mitscheme
        # guile
        # rust-analyzer
        # sbcl
        # scrcpy
        # semgrep
        sqlite
        # stack
        telegram-desktop
        terraform
        terraform-ls
        tinycc
        unrar
        valgrind
        wakatime-cli
        minikube
        kubectl
        docker-language-server
        docker-compose-language-service
        dockerfile-language-server-nodejs
        cachix
        prettierd
        # wasm-pack
        # wasmer
        # wasmtime
        # wasm-bindgen-cli
        # wasm-tools
        # waypipe
        # wget
        yaml-language-server
        # yarn
        # yazi
        # zig
        # zls
        # zlib
        # pyright

        # Games | Game-dev
        (config.lib.nixGL.wrap pkgs.love)
        (config.lib.nixGL.wrap pkgs.godot)
        # (config.lib.nixGL.wrap pkgs.aseprite)
        # (config.lib.nixGL.wrap pkgs.xonotic)
        # (config.lib.nixGL.wrap pkgs.mission-center)

        protontricks
        protonup

        # emacsPackages.prettier
        # emacsPackages.lsp-treemacs
        # emacsPackages.all-the-icons-nerd-fonts
        # nodePackages_latest.prettier

        # kdePackages.kdenlive

        # haskell-language-server

        # Fonts
        fira-sans
        # serious-shanns
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        # glslang
        # shaderc
        nixpkgs-fmt
        # cljfmt
        # scalafmt
        # multimarkdown
        # markdown-oxide
        # python312Packages.pip
        # python312Packages.grip
        # graphviz
        # ocamlPackages.ocamlformat

        # editorconfig

        luajit

        gdtoolkit_4

        # editorconfig-checker
        # eclint
        # editorconfig-core-c

        # ocamlPackages.utop
        # ocamlPackages.stdune

        nixfmt-rfc-style

        # woeusb
        woeusb-ng
        #ventoy-full
        qbittorrent
        # opencv

        # (lib.nixGL.wrap pkgs.unityhub)
        # bubblewrap
        # lutris

        ntfs3g

        fuse3

        # snes9x-gtk

        # ollama-rocm
        # ollama

        mesen
        # google-chrome
        # firefox

        avalonia-ilspy
        ilspycmd

        krita
        r2modman

        omnisharp-roslyn

        fennel-ls
        fnlfmt

        obsidian
      ]
      # ++ (with dotnetCorePackages; [
      #   sdk_8_0_1xx
      # ])
      ++ (with jetbrains; [
        rider
        #  goland
        #  rust-rover
      ])
      ++ (with luajitPackages; [
        fennel
      ])
      # ++ (
      #   with tree-sitter-grammars;
      #   (treesit-grammars.with-grammars (
      #     grammars: with grammars; [
      #       tree-sitter-fennel
      #       tree-sitter-c-sharp
      #       tree-sitter-c
      #       tree-sitter-go
      #       tree-sitter-zig
      #       tree-sitter-nix
      #       tree-sitter-lua
      #       tree-sitter-cpp
      #       tree-sitter-yaml
      #       tree-sitter-rust
      #       tree-sitter-toml
      #       tree-sitter-make
      #       tree-sitter-json
      #       tree-sitter-json5
      #       tree-sitter-jsdoc
      #       tree-sitter-glsl
      #       tree-sitter-bash
      #       tree-sitter-scala
      #       tree-sitter-gomod
      #       tree-sitter-elisp
      #       tree-sitter-cmake
      #       tree-sitter-scheme
      #       tree-sitter-python
      #       tree-sitter-graphql
      #       tree-sitter-markdown
      #       tree-sitter-typescript
      #       tree-sitter-javascript
      #       tree-sitter-commonlisp
      #       tree-sitter-dockerfile
      #     ]
      #   ))
      # )
    );

    keyboard = {
      layout = "br";
    };

    # file = {};
    sessionVariables = {
      DISABLE_MAGIC_FUNCTIONS = "true";
      # STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.home.homeDirectory}/.steam/root/compatibilitytools.d";
    };

    shell.enableZshIntegration = true;

    sessionPath = [
      "${config.xdg.configHome}/emacs/bin"
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/${config.programs.go.goBin}"
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };

  gtk = {
    enable = false;
  };

  manual = {
    json.enable = true;
    manpages.enable = true;
  };

  services = {
    ssh-agent = {
      enable = true;
    };

    gpg-agent = {
      enable = true;
      pinentry = {
        package = pkgs.pinentry-curses;
        program = "pinentry-curses";
      };
      # extraConfig = ''
      #   pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses
      # '';
    };
  };

  nix = {
    package = pkgs.nix;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "garicas"
        "@wheel"
      ];

      # trusted-public-keys = "lambda-core.cachix.org-1:0XbMbg3tgXa9r/og0Eeg/4NmTUlsH8FhaVAmgUS2c5w=";
      # trusted-substituters = "https://lambda-core.cachix.org";
    };

    registry = {
      microvm = {
        from = {
          id = "microvm";
          type = "indirect";
        };
        to = {
          owner = "astro";
          repo = "microvm.nix";
          type = "github";
        };
      };
    };
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        trim_trailing_whitespace = true;
        insert_final_newline = true;
        max_line_width = 78;
        indent_style = "space";
        indent_size = 4;
      };
    };
  };

  fonts = {
    fontconfig = {
      enable = false;
      defaultFonts = {
        emoji = [
          "noto-fonts-emoji"
          "noto-fonts-color-emoji"
        ];
        monospace = [
          "fira-code"
          "droid-sans-mono"
          "sauce-code-pro"
          "jetbrains-mono"
          "go-mono"
          "_0xproto"
        ];
        sansSerif = [
          "fira-sans"
          "serious-sans"
          "noto-fonts-cjk-sans"
        ];
        serif = [
          "noto-fonts-cjk-serif"
        ];
      };
    };
  };

  xdg = {
    enable = true;
    # portal = {
    #   enable = false;
    #   configPackages = with pkgs; [
    #     xdg-desktop-portal-kde
    #     xdg-desktop-portal-gtk
    #   ];
    #   config = {
    #     common = {
    #       default = [
    #         "gtk"
    #       ];
    #     };
    #   };
    #   extraPortals = with pkgs; [
    #     xdg-desktop-portal-kde
    #     xdg-desktop-portal-gtk
    #   ];
    #   xdgOpenUsePortal = true;
    # };

    desktopEntries = {
      doomEmacs = {
        name = "Doom Emacs";
        genericName = "Text Editor";
        categories = [
          "Development"
          "TextEditor"
        ];
        exec = "${config.xdg.configHome}/emacs/bin/doom run";
        icon = "emacs";
        mimeType = [
          "text/english"
          "text/plain"
          "text/x-makefile"
          "text/x-c++hdr"
          "text/x-c++src"
          "text/x-chdr"
          "text/x-csrc"
          "text/x-java"
          "text/x-moc"
          "text/x-pascal"
          "text/x-tcl"
          "text/x-tex"
          "application/x-shellscript"
          "text/x-c"
          "text/x-c++"
        ];
        startupNotify = true;
        terminal = false;
        type = "Application";
      };

      gameMaker = {
        name = "Game Maker";
        genericName = "Game Development";
        categories = [
          "Development"
        ];
        exec = "/opt/GameMaker-Beta/x86_64/GameMaker";
        icon = "/opt/GameMaker-Beta/GameMaker.png";
        # mimeType = [
        #   "text/english"
        #   "text/plain"
        #   "text/x-makefile"
        #   "text/x-c++hdr"
        #   "text/x-c++src"
        #   "text/x-chdr"
        #   "text/x-csrc"
        #   "text/x-java"
        #   "text/x-moc"
        #   "text/x-pascal"
        #   "text/x-tcl"
        #   "text/x-tex"
        #   "application/x-shellscript"
        #   "text/x-c"
        #   "text/x-c++"
        # ];
        startupNotify = true;
        terminal = false;
        type = "Application";
      };
    };
  };

  programs = {

    home-manager = {
      enable = true;
    };

    nh = {
      enable = true;
    };

    git = {
      enable = true;
      userEmail = "matheus.dasilva.garcias@gmail.com";
      userName = "0xdeadbad";
      signing = {
        key = "9F417D809221DD61";
        signByDefault = true;
      };
      difftastic = {
        enable = true;
        background = "dark";
      };
    };

    gpg = {
      enable = true;
      scdaemonSettings = {
        disable-ccid = false;
      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      defaultKeymap = "viins";
      syntaxHighlighting = {
        enable = true;
      };
      autosuggestion = {
        enable = false;
      };
      history = {
        append = true;
      };
      historySubstringSearch = {
        enable = false;
      };
      prezto = {
        enable = false;
      };
      localVariables = {
        DISABLE_MAGIC_FUNCTIONS = true;
      };
      # initExtraFirst = '''';
      initContent = ''
        bindkey  "^[[1~"   beginning-of-line
        bindkey  "^[[4~"   end-of-line
      '';
      oh-my-zsh = {
        enable = true;
        theme = "gentoo";
        plugins = [
          "git"
          "git-auto-fetch"
          "fzf-tab"
          # "history-substring-search"
          # "zsh-interactive-cd"
        ];
        custom = "$HOME/.omz/custom";
        extraConfig = ''
          zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
        '';
      };
    };

    tmux = {
      enable = true;
      clock24 = true;
      historyLimit = 10000;
      keyMode = "vi";
      mouse = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "alacritty";
      extraConfig = ''
        # reload config file (change file location to your the tmux.conf you want to use)
        bind r source-file ${config.xdg.configHome}/tmux/tmux.conf
        # move between windows faster using Shift plus arrows
        bind -n S-Right next-window
        bind -n S-Left previous-window
        # unbind default split bindings
        unbind '"'
        unbind %
        # split panes using M-h and M-v
        bind -n M-h split-window -h
        bind -n M-v split-window -v
        # switch panes using Alt-arrow without prefix
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D
        # don't rename windows automatically
        set-option -g allow-rename on
      '';
    };

    vscode = {
      enable = false;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      coc = {
        enable = true;
        settings = {
          "suggest.noselect" = true;
          "suggest.enablePreview" = true;
          "suggest.enablePreselect" = false;
          "suggest.disableKind" = true;

          languageserver = {
            nix = {
              command = "${pkgs.nil}/bin/nil";
              filetypes = [ "nix" ];
              rootPatterns = [ "flake.nix" ];
              settings = {
                nil = {
                  formatting = {
                    command = [ "${pkgs.nixfmt-rfc-style}/bin/nixfmt" ];
                  };
                };
              };
            };

            go = {
              command = "${config.home.homeDirectory}/${config.programs.go.goPath}/bin/gopls";
              rootPatterns = [ "go.mod" ];
              trace.server = "verbose";
              filetypes = [ "go" ];
            };

          };
        };
      };
      viAlias = true;
      vimAlias = true;
      withNodeJs = true;
      withPython3 = true;
    };

    alacritty = {
      enable = true;
      package = (config.lib.nixGL.wrap pkgs.alacritty);
      settings = {
        window = {
          decorations = "None";
          startup_mode = "Maximized";
          decorations_theme_variant = "Dark";
        };
        cursor = {
          style = {
            shape = "Underline";
            blinking = "Always";
          };
          vi_mode_style = {
            shape = "Underline";
            blinking = "Always";
          };
        };
        terminal = {
          shell = {
            program = "${pkgs.zsh}/bin/zsh";
            args = [
              "-l"
              "-c"
              "${pkgs.tmux}/bin/tmux attach || ${pkgs.tmux}/bin/tmux"
            ];
          };
        };
        mouse = {
          hide_when_typing = true;
        };
      };
    };

    java = {
      enable = true;
      package = pkgs.graalvm-ce;
    };

    direnv = {
      enable = true;
      nix-direnv = {
        enable = true;
      };
    };

    sm64ex = {
      enable = false;
    };

    hstr = {
      enable = true;
    };

    htop = {
      enable = true;
      settings = { };
    };

    btop = {
      enable = true;
    };

    bun = {
      enable = false;
      settings = {
        telemetry = false;
      };
    };

    go = {
      enable = true;
      goPath = "go";
      goBin = "${config.programs.go.goPath}/bin";
    };

    jq = {
      enable = true;
      # colors = {
      # null = "1;30";
      # false = "0;31";
      # true = "0;32";
      # numbers = "0;36";
      # strings = "0;33";
      # arrays = "1;35";
      # objects = "1;37";
      # };
    };

    jqp = {
      enable = true;
    };

    fd = {
      enable = true;
    };

    feh = {
      enable = true;
    };

    fzf = {
      enable = true;
      defaultCommand = "${config.programs.fd.package}/bin/fd --type f";
      defaultOptions = [
        "--tmux center"
        "--style full"
        "--preview '${pkgs.bat}/bin/bat -n --color=always {}'"
      ];
      fileWidgetCommand = "${config.programs.ripgrep.package}/bin/rg -lU '^[\x00-\x7F]*$'";
      fileWidgetOptions = [
        "--style full"
        "--preview ${pkgs.bat}/bin/bat -n --color=always {}"
      ];
      # fileWidgetOptions = [
      #   "--tmux center"
      #   "--style full"
      #   "--preview 'bat -n --color=always {}'"
      # ];
      # changeDirWidgetOptions = [
      #     "--preview 'tree -C {}'"
      # ];
      tmux = {
        enableShellIntegration = true;
        shellIntegrationOptions = [
          "-p50%"
        ];
      };
    };

    nnn = {
      enable = false;
    };

    man = {
      enable = true;
    };

    mpv = {
      enable = true;
    };

    nix-index = {
      enable = false;
    };

    obs-studio = {
      enable = true;
      plugins = [ ];
      package = with pkgs; (config.lib.nixGL.wrap obs-studio);
    };

    opam = {
      enable = false;
    };

    pyenv = {
      enable = true;
    };

    poetry = {
      enable = true;
      settings = {
        virtualenvs.create = true;
        virtualenvs.in-project = true;
      };
    };

    pylint = {
      enable = false;
      settings = { };
    };

    ruff = {
      enable = false;
      settings = {
        line-length = 80;
        indent-width = 4;
        target-version = "py312";
        lint = {
          select = [
            "E4"
            "E7"
            "E9"
            "F"
            "I"
          ];
          ignore = [ "F841" ];
        };
      };
    };

    ranger = {
      enable = false;
      plugins = [
        {
          name = "zoxide";
          src = builtins.fetchGit {
            url = "https://github.com/jchook/ranger-zoxide.git";
            rev = "281828de060299f73fe0b02fcabf4f2f2bd78ab3";
          };
        }
      ];
    };

    readline = {
      enable = true;
    };

    ripgrep = {
      enable = true;
    };

    rofi = {
      enable = true;
      extraConfig = {
        modi = "window,drun,ssh";
        kb-primary-paste = "Control+V,Shift+Insert";
        kb-secondary-paste = "Control+v,Insert";
      };
    };

    senpai = {
      enable = false;
    };

    skim = {
      enable = true;
      defaultCommand = "${pkgs.ripgrep}/bin/rg --color=always --line-number \"{}\"";
      defaultOptions = [
        "--height 40%"
        "--prompt ⟫"
        "--ansi"
        "-i"
      ];
    };

    halloy = {
      enable = true;
    };

    havoc = {
      enable = true;
    };

    spotify-player = {
      enable = false;
    };

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    emacs = {
      enable = true;
      package = pkgs.emacs30;
      extraPackages =
        epkgs: with epkgs; [
          treesit-auto
          tree-sitter
          tree-sitter-langs
          tree-sitter-indent
          tree-sitter-ispell
        ];
      # package =
      #   (import ./emacs.nix {
      #     emacsdir = "${config.xdg.configHome}/emacs";
      #     doomdir = "${config.xdg.configHome}/doom";
      #     inherit pkgs;
      #   }).emacs;
    };
  };

  wayland = {
    windowManager = {
      hyprland = {
        enable = false;
      };
    };
  };
}
