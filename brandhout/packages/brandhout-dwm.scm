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
          (base32 "15cvpqy814a5r6yg59y6iccszgi5h51n20rg3qhk18xqhpqa933f"))))))

