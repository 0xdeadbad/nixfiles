{
  config,
  pkgs,
  ...
}:
{
  home = {
    username = "garicas";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "25.05";
    packages =
      with pkgs;
      [
        # android-tools
        # bash-language-server
        # cachix
        # c3c
        # llvmPackages_19.clang-tools
        # clojure
        # csharpier
        # cmake
        # ansible
        # dockfmt
        containerd
        # coursier
        # crosvm
        # curl
        delta
        devenv
        discord
        # docker
        # docker-buildx
        # docker-compose
        # deno
        fastfetch
        file
        # firecracker
        # firectl
        # flintlock
        glibc
        #gtk2
        #gtk2-x11
        gtk3
        gtk3-x11
        gomodifytags
        gore
        gnumake
        gparted
        # kdiskmark
        # luajit
        # lua-language-server
        # metals
        nerdctl
        #     nerdfonts
        # ninja
        # nix-snapshotter
        nix-zsh-completions
        nil
        marksman
        nodejs
        # openfga-cli
        # opentofu
        openssl
        #      pinentry-tty
        pinentry-curses
        pinentry-rofi
        python312Full
        # qbe
        rpi-imager
        shfmt
        shellcheck
        remmina
        rustup
        # sbcl
        # scrcpy
        # semgrep
        sqlite
        # stack
        telegram-desktop
        # terraform
        # terraform-ls
        # tinycc
        unrar
        valgrind
        wakatime-cli
        # wasm-pack
        # wasmer
        # wasmtime
        # wasm-bindgen-cli
        # wasm-tools
        # waypipe
        wget
        # yaml-language-server
        # yarn
        # yazi
        # zig
        # zls
        zlib

        # Games | Game-dev
        # love
        # xonotic

        # protontricks
        # protonup

        #      emacsPackages.prettier
        #      emacsPackages.lsp-treemacs
        #      emacsPackages.all-the-icons-nerd-fonts
        # nodePackages_latest.prettier

        # kdePackages.kdenlive

        # haskell-language-server

        # Fonts
        fira-sans
        serious-sans
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif

        glslang
        #      shaderc
        nixpkgs-fmt
        # cljfmt
        # scalafmt
        # multimarkdown
        # markdown-oxide
        python312Packages.pip
        python312Packages.grip
        # graphviz
        #      ocamlPackages.ocamlformat

        #      editorconfig

        gdtoolkit_4

        # editorconfig-checker
        # eclint
        # editorconfig-core-c

        #      ocamlPackages.utop
        #      ocamlPackages.stdune

        nixfmt-rfc-style

        # r2modman

        # woeusb
        woeusb-ng
        ventoy-full
        qbittorrent

        # unityhub
        # lutris

        ntfs3g

        fuse3

        # snes9x-gtk

        # ollama-rocm

        mission-center
        mesen
        # google-chrome
        # firefox
      ]
      # ++ (with pkgs.dotnetCorePackages; [
      #   sdk_8_0_1xx
      # ])
      # ++ (with dotnetPackages; [
      #   Nuget
      # ])
      ++ (with nerd-fonts; [
        fira-code
        droid-sans-mono
        sauce-code-pro
        jetbrains-mono
        go-mono
        _0xproto
      ])
    # ++ (with ocamlPackages; [
    #   ocamlformat
    #   ocp-indent
    #   merlin
    # ])
    # ++ (with haskellPackages; [
    #   hoogle
    #   cabal-install
    # ])
    # ++ (with nodePackages_latest; [
    #   prettier
    # ])
    # ++ (with jetbrains; [
    #   rider
    #   goland
    #   rust-rover
    # ])
    ;
    keyboard = {
      layout = "br";
    };
    # file = {};
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "${config.home.homeDirectory}/.steam/root/compatibilitytools.d";
    };
    sessionPath = [
      "${config.xdg.configHome}/emacs/bin"
      "${config.home.homeDirectory}/.local/bin"
      "${config.home.homeDirectory}/${config.programs.go.goBin}"
    ];
  };

  gtk = {
    enable = false;
  };

  manual = {
    json.enable = true;
  };

  services = {
    ssh-agent = {
      enable = true;
    };

    gpg-agent = {
      enable = true;
      extraConfig = ''
        pinentry-program ${pkgs.pinentry-curses}/bin/pinentry-curses
      '';
    };
  };

  nix = {
    # registry = {
    #   microvm = {
    #     from = {
    #       id = "microvm";
    #       type = "indirect";
    #     };
    #     to = {
    #       owner = "astro";
    #       repo = "microvm.nix";
    #       type = "github";
    #     };
    #   };
    # };
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
        indent_size = 2;
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
    portal = {
      enable = false;
      configPackages = with pkgs; [
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-kde
        xdg-desktop-portal-gtk
      ];
      xdgOpenUsePortal = true;
    };

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
    };
  };

  programs = {
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
      settings = {
        # allow-emacs-pinentry = true;
      };
      #     publicKeys = {

      #      };
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      enableVteIntegration = true;
      defaultKeymap = "emacs";
      autosuggestion = {
        enable = true;
      };
      history = {
        append = true;
      };
      historySubstringSearch = {
        enable = true;
      };
      prezto = {
        enable = false;
      };
      oh-my-zsh = {
        enable = true;
        theme = "gentoo";
        plugins = [
          "git"
          "git-auto-fetch"
          #          "history-substring-search"
          "zsh-interactive-cd"
        ];
      };
    };

    tmux = {
      enable = true;
      clock24 = true;
      historyLimit = 10000;
      keyMode = "emacs";
      mouse = true;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "xterm-256color";
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
        set-option -g allow-rename off
      '';
    };

    vscode = {
      enable = true;
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
      package = pkgs.alacritty;
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
      colors = {
        null = "1;30";
        false = "0;31";
        true = "0;32";
        numbers = "0;36";
        strings = "0;33";
        arrays = "1;35";
        objects = "1;37";
      };
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
      ];
      tmux = {
        enableShellIntegration = false;
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
    };

    opam = {
      enable = false;
    };

    pyenv = {
      enable = false;
    };

    poetry = {
      enable = true;
      settings = {
        virtualenvs.create = true;
        virtualenvs.in-project = true;
      };
    };

    pylint = {
      enable = true;
      settings = { };
    };

    ruff = {
      enable = true;
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
      enable = true;
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

    spotify-player = {
      enable = false;
    };

    ssh = {
      enable = true;
      addKeysToAgent = "yes";
    };

    emacs = {
      enable = true;
      package =
        (import ./emacs.nix {
          emacsdir = "${config.xdg.configHome}/emacs";
          doomdir = "${config.xdg.configHome}/doom";
        }).emacs;
    };
  };
}
