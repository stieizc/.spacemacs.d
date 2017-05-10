;;; packages.el --- org-simple-wiki layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <wenxin@archie>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `org-simple-wiki-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-simple-wiki/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-simple-wiki/pre-init-PACKAGE' and/or
;;   `org-simple-wiki/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst org-simple-wiki-packages
  '((org-simple-wiki :location (recipe
                                :fetcher github
                                :repo "wenxin-wang/org-simple-wiki"))))

(defun org-simple-wiki/init-org-simple-wiki ()
  (use-package org-simple-wiki
    :config
    (progn
      ;; key bindings
      (spacemacs/declare-prefix "aw" "org-simple-wiki-prefix")
      (spacemacs/set-leader-keys
        "awf" #'org-simple-wiki-find-file
        "awk" #'org-simple-wiki-find-file-by-keyword
        "aws" #'org-simple-wiki-search-ag
        "awS" #'org-simple-wiki-search-keyword-ag))))

;;; packages.el ends here
