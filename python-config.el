;; Python
(use-package company-jedi
  :after company
  :defer t
  :config
  (setq jedi:complete-on-dot t)
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'config/enable-company-jedi))

(use-package virtualenvwrapper
  :defer t)

(use-package auto-virtualenvwrapper
  :defer t)

(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :defer t
  :init
  (add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)
  :config
  ;; https://github.com/jorgenschaefer/elpy/issues/887
  (setq python-shell-completion-native-enable nil))