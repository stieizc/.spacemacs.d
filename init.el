
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     csv
     windows-scripts
     php
     nginx
     ruby
     ;; themes-megapack
     octave
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     git version-control
     python emacs-lisp
     ;ess
     (javascript :variables
                 javascript-disable-tern-port-files nil)
     markdown yaml
     (latex :variables
            latex-enable-auto-fill t
            latex-enable-folding t)
     (c-c++ :variables
            c-c++-enable-clang-support t)
     haskell rust scala go
     gtags;cscope;semantic
     ;puppet
     ipython-notebook
     (clojure :variables
              clojure-enable-fancify-symbols t)
     (org :variables
          org-startup-truncated nil
          org-startup-folded nil)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     html
     proof-general ;moinmoin
     ;tabbar
     ;react
     org-simple-wiki)
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages
   '(verilog-mode
     salt-mode jinja2-mode
     protobuf-mode unicode-fonts all-the-icons doom-themes
     gnuplot-mode google-c-style)
   ;; A list of packages and/or extensions that will not be install and loaded.
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '(ensime . "melpa-stable") package-pinned-packages)
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   ;; dotspacemacs-themes '(niflheim
   ;;                       farmhouse-dark
   ;;                       soft-stone
   ;;                       farmhouse-light
   ;;                       leuven
   ;;                       smyx
   ;;                       solarized)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG M"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   dotspacemacs-line-numbers t))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  (autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
  (add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode)))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (require 'helm-bookmark) ; https://github.com/syl20bnr/spacemacs/pull/9547
  (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "xdg-open")
  (with-eval-after-load 'linum
    (linum-relative-toggle))

  (defun artist-mode-toggle-emacs-state ()
    (if artist-mode
        (evil-emacs-state)
      (evil-exit-emacs-state)))

  (unless (eq dotspacemacs-editing-style 'emacs)
    (add-hook 'artist-mode-hook #'artist-mode-toggle-emacs-state))

  ;(spacemacs/set-monospaced-font "Meslo LG M" "WenQuanYi Zen Hei Mono" 15 15)
  (unicode-fonts-setup)
  (add-hook 'git-commit-mode-hook
            '(lambda () (setq fill-column 66))
            t)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (add-hook 'Info-mode-hook 'turn-off-evil-mode)
  (setq TeX-view-program-list '(("Evince" "evince %o")))
  (setq TeX-view-program-selection '((output-pdf "Evince")))
  (setq LaTeX-verbatim-environments-local '("Verbatim"))
  (defun my/c-common-hook ()
    (c-set-offset 'case-label '+)
    (c-set-offset 'arglist-intro '+)
    (c-set-offset 'arglist-cont-nonempty '0))
  (add-hook 'c-mode-hook 'my/c-common-hook)
  (add-hook 'c++-mode-hook 'my/c-common-hook)
  (add-hook
   'c++-mode-hook
   (lambda () (setq flycheck-clang-language-standard "c++11")))
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode
    "mht"  'ghc-show-type)
  (add-hook
   'org-mode-hook
   (lambda ()
     (progn
       (add-to-list 'org-file-apps '("\\.pdf\\'" . "xdg-open %s"))
       (org-clock-persistence-insinuate))))
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (custom-set-variables
   '(enable-local-variables :all)
   '(neo-show-hidden-files nil)
   '(neo-hidden-regexp-list '("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" "\\.d$"))
   '(tramp-default-method "ssh")
   '(org-simple-wiki-location "~/Personal/wiki")
   '(evil-search-module 'evil-search)
   '(org-modules
     '(org-habit org-w3m org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail))
   '(org-latex-pdf-process
     '(
       "xelatex -interaction nonstopmode %f"
       "xelatex -interaction nonstopmode %f"
       "xelatex -interaction nonstopmode %f"
       ))
   ;'(org-descriptive-links nil)
   '(org-agenda-files '("~/Tasks"))

   '(c-default-style "linux")
   '(tab-width 4)
   '(c-basic-offset 4)

   '(js2-basic-offset 2)
   '(js-indent-level 2)
   '(projectile-use-git-grep t)
   '(cider-default-repl-command "boot")
   '(octave-block-offset 4)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(c-default-style "linux")
 '(cider-default-repl-command "boot")
 '(evil-search-module (quote evil-search))
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(neo-hidden-regexp-list
   (quote
    ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" "\\.d$")))
 '(neo-show-hidden-files nil t)
 '(octave-block-offset 4)
 '(org-agenda-files (quote ("~/Tasks")))
 '(org-latex-pdf-process
   (quote
    ("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f")))
 '(org-modules
   (quote
    (org-habit org-w3m org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail)))
 '(org-simple-wiki-location "~/Personal/wiki")
 '(package-selected-packages
   (quote
    (ucs-utils font-utils persistent-soft list-utils pcache gitignore-mode fringe-helper git-gutter+ git-gutter flyspell-correct pos-tip flx anzu request web-completion-data dash-functional peg eval-sexp-fu seq spinner pkg-info epl bind-map f auto-complete popup which-key web-mode use-package ujelly-theme toc-org tao-theme tangotango-theme sublime-themes spaceline powerline solarized-theme slim-mode salt-mode yaml-mode ruby-test-mode robe restart-emacs rake rainbow-delimiters pyvenv pytest pyenv-mode pug-mode protobuf-mode phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode orgit organic-green-theme org-projectile org-category-capture org-download obsidian-theme nginx-mode mustang-theme move-text monokai-theme moe-theme mmm-mode markdown-toc markdown-mode magit-gitflow live-py-mode link-hint json-mode js2-refactor jbeans-theme intero inkpot-theme info+ hy-mode hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers helm-swoop helm-projectile helm-make projectile helm-company gruvbox-theme gruber-darker-theme gotham-theme google-translate go-guru gnuplot-mode gitconfig-mode git-link ggtags flycheck-haskell fill-column-indicator evil-surround evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup evil-escape evil-ediff espresso-theme ensime sbt-mode scala-mode ein request-deferred websocket deferred dumb-jump drupal-mode doom-themes diff-hl define-word darktooth-theme darkokai-theme dakrone-theme cython-mode cyberpunk-theme company-go company-ghc ghc company-coq company-math company-cabal company-c-headers color-theme-sanityinc-tomorrow clojure-snippets clj-refactor inflections multiple-cursors cider queue clojure-mode cargo busybee-theme auto-compile packed auctex-latexmk apropospriate-theme all-the-icons memoize alect-themes aggressive-indent ace-window ace-link avy inf-ruby anaconda-mode auctex haskell-mode tern company iedit smartparens highlight evil goto-chg undo-tree flycheck git-commit with-editor go-mode helm helm-core async skewer-mode js2-mode simple-httpd alert org-plus-contrib hydra yasnippet php-mode rust-mode haml-mode dash s zonokai-theme zenburn-theme zen-and-art-theme yapfify ws-butler winum web-beautify volatile-highlights vi-tilde-fringe uuidgen unicode-fonts underwater-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode tango-plus-theme tango-2-theme tagedit sunny-day-theme subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle seti-theme scss-mode sass-mode rvm ruby-tools rubocop rspec-mode reverse-theme rbenv railscasts-theme racer pythonic py-isort purple-haze-theme professional-theme powershell popwin planet-theme pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pcre2el pastels-on-dark-theme parent-mode paredit paradox org-simple-wiki org-present org-pomodoro org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme noflet noctilux-theme niflheim-theme neotree naquadah-theme monochrome-theme molokai-theme mmm-jinja2 minitest minimal-theme math-symbol-lists material-theme majapahit-theme madhat2r-theme macrostep lush-theme lorem-ipsum log4e livid-mode linum-relative light-soap-theme less-css-mode json-snatcher json-reformat js-doc jinja2-mode jazz-theme ir-black-theme indent-guide hungry-delete htmlize highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-pydoc helm-mode-manager helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets grandshell-theme google-c-style golden-ratio go-eldoc gnuplot gntp gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme fuzzy font-lock+ flyspell-correct-helm flycheck-rust flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-args evil-anzu emmet-mode elisp-slime-nav edn dracula-theme django-theme disaster diminish darkmine-theme darkburn-theme csv-mode company-web company-tern company-statistics company-ghci company-auctex company-anaconda column-enforce-mode color-theme-sanityinc-solarized coffee-mode cmm-mode cmake-mode clues-theme clean-aindent-mode clang-format cider-eval-sexp-fu chruby cherry-blossom-theme bundler bubbleberry-theme birds-of-paradise-plus-theme bind-key badwolf-theme autothemer auto-yasnippet auto-highlight-symbol auto-dictionary anti-zenburn-theme ample-zen-theme ample-theme afternoon-theme adaptive-wrap ace-jump-helm-line ac-ispell)))
 '(projectile-use-git-grep t)
 '(safe-local-variable-values (quote ((eval google-set-c-style))))
 '(tab-width 4)
 '(tramp-default-method "ssh"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
