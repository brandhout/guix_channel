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
          (commit "aabf7d33045ce1c30db5fdffea1fba5f1b6bec62")))
        (sha256
          (base32 "1w5f29jiinngdrbxblckb0xx79zgvdgzfd5vcg7r9fn5az813c63"))))))

