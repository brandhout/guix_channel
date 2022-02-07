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
          (commit "d427984fbf22ca8655f2b262ac0474176bb86af6")))
        (sha256
          (base32 "0k2avqsqrba1v888ikjsb0vfgwkpj7aksinrkcc3ki9linp6kd0m"))))))

