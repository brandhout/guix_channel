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
          (commit "a697f583f5aa69e74027accd3b5b6a84a1e1b6ee")))
        (sha256
          (base32 "0mid4ckp9pc18c1yksw4g8k1qama5w866dqnfzm6bnn98aw130vq"))))))

