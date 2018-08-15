
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
     sql
     lua
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
     gtags;cscope
     semantic
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
   dotspacemacs-default-font '(("Meslo LG M"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1))
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
  (defun font-frame-hook (frame)
    (display-warning :warning "HEYHEYYOUYOU")
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font
       t ;(frame-parameter frame 'font)
       charset (font-spec :family "WenQuanYi Micro Hei Mono" :size 15))))
  (setq face-font-rescale-alist '(("WenQuanYi Micro Hei Mono" . 1.2)))
  (add-hook 'after-make-frame-functions #'font-frame-hook)
  (require 'helm-bookmark) ; https://github.com/syl20bnr/spacemacs/pull/9547
  (setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "xdg-open")

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
  (setq markdown-fontify-code-blocks-natively t)
  (add-hook
   'org-mode-hook
   (lambda ()
     (progn
       (org-clock-persistence-insinuate))))
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (custom-set-variables
   '(salt-mode-python-program "python2")
   '(org-startup-indented t)
   '(org-structure-template-alist '(("t" "#+TITLE: ?")
                                    ("b" "#+BEGIN_?\n\n#+END_")
                                    ("z" "#+BEGIN_LANG zh_CN?\n\n#+END_LANG")
                                    ("s" "#+BEGIN_SRC ?\n\n#+END_SRC")
                                    ("e" "#+BEGIN_EXAMPLE\n?\n#+END_EXAMPLE")
                                    ("q" "#+BEGIN_QUOTE\n?\n#+END_QUOTE")
                                    ("v" "#+BEGIN_VERSE\n?\n#+END_VERSE")
                                    ("V" "#+BEGIN_VERBATIM\n?\n#+END_VERBATIM")
                                    ("c" "#+BEGIN_CENTER\n?\n#+END_CENTER")
                                    ("C" "#+BEGIN_COMMENT\n?\n#+END_COMMENT")
                                    ("l" "#+BEGIN_EXPORT latex\n?\n#+END_EXPORT")
                                    ("L" "#+LaTeX: ")
                                    ("h" "#+BEGIN_EXPORT html\n?\n#+END_EXPORT")
                                    ("H" "#+HTML: ")
                                    ("a" "#+BEGIN_EXPORT ascii\n?\n#+END_EXPORT")
                                    ("A" "#+ASCII: ")
                                    ("i" "#+INDEX: ?")
                                    ("I" "#+INCLUDE: %file ?")))
   '(org-file-apps '((auto-mode . emacs)
                     ("\\.mm\\'" . default)
                     ("\\.x?html?\\'" . default)
                     ("\\.pdf\\'" . "xdg-open %s")))
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
 '(enable-local-variables :all)
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol t)
 '(js-indent-level 2)
 '(js2-basic-offset 2)
 '(neo-hidden-regexp-list
   (quote
    ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.o$" "\\.d$")))
 '(neo-show-hidden-files nil t)
 '(octave-block-offset 4)
 '(org-agenda-files (quote ("~/Tasks")))
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "xdg-open %s"))))
 '(org-latex-pdf-process
   (quote
    ("xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f" "xelatex -interaction nonstopmode %f")))
 '(org-modules
   (quote
    (org-habit org-w3m org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail)))
 '(org-simple-wiki-location "~/Personal/wiki")
 '(org-startup-indented t)
 '(org-structure-template-alist
   (quote
    (("t" "#+TITLE: ?")
     ("b" "#+BEGIN_?

#+END_")
     ("z" "#+BEGIN_LANG zh_CN?

#+END_LANG")
     ("s" "#+BEGIN_SRC ?

#+END_SRC")
     ("e" "#+BEGIN_EXAMPLE
?
#+END_EXAMPLE")
     ("q" "#+BEGIN_QUOTE
?
#+END_QUOTE")
     ("v" "#+BEGIN_VERSE
?
#+END_VERSE")
     ("V" "#+BEGIN_VERBATIM
?
#+END_VERBATIM")
     ("c" "#+BEGIN_CENTER
?
#+END_CENTER")
     ("C" "#+BEGIN_COMMENT
?
#+END_COMMENT")
     ("l" "#+BEGIN_EXPORT latex
?
#+END_EXPORT")
     ("L" "#+LaTeX: ")
     ("h" "#+BEGIN_EXPORT html
?
#+END_EXPORT")
     ("H" "#+HTML: ")
     ("a" "#+BEGIN_EXPORT ascii
?
#+END_EXPORT")
     ("A" "#+ASCII: ")
     ("i" "#+INDEX: ?")
     ("I" "#+INCLUDE: %file ?"))))
 '(package-selected-packages
   (quote
    (sql-indent lua-mode intero flycheck-haskell evil-magit deferred company-math helm magit ghub let-alist winum web-mode use-package spaceline powerline ruby-test-mode rspec-mode pug-mode persp-mode org-simple-wiki org-projectile live-py-mode hy-mode htmlize ein doom-themes disaster column-enforce-mode clean-aindent-mode cargo dash-functional smartparens evil flycheck haskell-mode company helm-core markdown-mode alert org-plus-contrib magit-popup async php-mode dash yapfify ws-butler which-key websocket web-beautify volatile-highlights vi-tilde-fringe uuidgen unicode-fonts undo-tree toml-mode toc-org tagedit stickyfunc-enhance srefactor smeargle slim-mode scss-mode sass-mode salt-mode rvm ruby-tools rubocop robe restart-emacs request-deferred rbenv rake rainbow-delimiters racer pyvenv pytest pyenv-mode py-isort protobuf-mode powershell popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pcre2el paradox orgit org-present org-pomodoro org-download org-category-capture org-bullets open-junk-file noflet nginx-mode neotree move-text minitest math-symbol-lists markdown-toc magit-gitflow macrostep lorem-ipsum log4e livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc jinja2-mode info+ indent-guide hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-hoogle helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haskell-snippets goto-chg google-translate google-c-style golden-ratio go-guru go-eldoc gnuplot-mode gnuplot gntp gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-helm flycheck-rust flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ensime emmet-mode elisp-slime-nav dumb-jump drupal-mode diminish diff-hl define-word cython-mode csv-mode company-web company-tern company-statistics company-go company-ghci company-ghc company-coq company-cabal company-c-headers company-auctex company-anaconda coffee-mode cmm-mode cmake-mode clojure-snippets clj-refactor clang-format cider-eval-sexp-fu chruby bundler bind-key auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile auctex-latexmk all-the-icons aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(projectile-use-git-grep t)
 '(tab-width 4)
 '(tramp-default-method "ssh" nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
