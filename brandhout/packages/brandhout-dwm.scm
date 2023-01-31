(define-module (brandhout packages brandhout-dwm)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages))

(define-public brandhout-dwm
  (package
    (inherit dwm)
    (name "brandhout-dwm")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/brandhout/poor_dwm_fork.git")
          (commit "91c21a41fbe86a0740b21755e4294c022d9ffa96")))
        (sha256
          (base32 "10i0gsafd4i376m9mafp5xjc9k0q5jwbmd9vlih1i41bxs9k18ly"))))))

