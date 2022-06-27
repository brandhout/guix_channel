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
          (commit "708b3a31875cd5eea718fd3ce62652821dbb57ef")))
        (sha256
          (base32 "0g8xyyqwnxw28ifg5vnb9qz17nki69x1b8hp4p35n56d037yf0zc"))))))

