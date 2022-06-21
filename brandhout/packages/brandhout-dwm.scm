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
          (commit "0b72c6e04a7b7c1a4816b8d6dc4c77c2f646ad0a")))
        (sha256
          (base32 "s1bf9q4fdnz5a9kjh0pykm240iq8d0vws9lzm5a8vqhnnpk0yc3z"))))))

