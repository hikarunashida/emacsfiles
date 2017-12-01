(use-package find-file-in-project
  :ensure t
  :config
  (add-to-list 'ffip-prune-patterns "*/out/*")
  (add-to-list 'ffip-prune-patterns "*target/*")
  :bind
  ("<C-return>" . find-file-in-project))

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (ignore-errors (ffip-project-root)))
        (file-name (buffer-file-name)))
    (if project-dir
        (progn
          (neotree-dir project-dir)
          (neotree-find file-name))
      (neotree-find file-name))))

(use-package all-the-icons
  :defer t)

(use-package neotree
  :ensure t
  :defer t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-smart-open t)
  :bind
  ("C-x C-d" . neotree-project-dir))

(defun show-todos ()
  (interactive)
  (ag-project-regexp "TODO|FIXME"))
(global-set-key (kbd "C-x t") 'show-todos)
