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
          (commit "bfca63ee0a7060f19c806f5a4be2b92bb20cd905")))
        (sha256
          (base32 "1n5525ndalqf8iskwzaqm5p3y5wn8w1v7y0bn9asg6r9w5dzkkn7"))))))

