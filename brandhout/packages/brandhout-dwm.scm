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
             (commit "9b73d162a79dfd1ecb5c9cafa156c8d058f9cf17")))
       (sha256
        (base32 "07xr2302rf642gdrf4n5viqfmrlgzg11l9l14n9ywj651spmvwfw"))))))

