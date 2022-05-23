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
          (commit "4ddbef64f3ecbfcf97a4506f7c8626016dc593d6")))
        (sha256
          (base32 "121kp67r56way37735x0b2mbjfs2r4q4v5jmja7bmcv60g7y2bfx"))))))

