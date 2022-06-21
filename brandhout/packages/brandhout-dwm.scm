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
          (commit "5549b1dfda9d6c41e7989f36cc675b61796a7fc5")))
        (sha256
          (base32 "0h9wdbaw566flj2fjlaf2bxb0acbwijkcbjbr4clci16h3x22czy"))))))

