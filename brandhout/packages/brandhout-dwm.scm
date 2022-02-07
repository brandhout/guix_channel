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
          (commit "427984fbf22ca8655f2b262ac0474176bb86af6")))
        (sha256
          (base32 "1vy9np307c5hpwgap2ivn5qcvdjpjl4y24mia5i39k1f3admjmgf"))))))

