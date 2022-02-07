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
          (commit "8a2ae19945a78cb0302f825ae26eacd1ed9667b0")))
        (sha256
          (base32 "1vy9np307c5hpwgap2ivn5qcvdjpjl4y24mia5i39k1f3admjmgf"))))))

