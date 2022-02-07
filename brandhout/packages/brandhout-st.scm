(define-module (brandhout packages brandhout-st)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages))

(define-public brandhout-st
  (package
    (inherit st)
    (name "brandhout-st")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/brandhout/poor_st_fork.git")
          (commit "1a6adbde11725f40125f43c5f6d53b2ff3232d6c")))
        (sha256
          (base32 "1n5ijn0l0rbxkr15jgi52mkgkj56w26mdkrvbj0ppsiyzi3qcgjz"))))))
