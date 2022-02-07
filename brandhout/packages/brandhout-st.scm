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
          (commit "047dc8b575e8baca849920eab38a7892ce106881")))
        (sha256
          (base32 "0y209r8nsa5vhvxf5zsmmpqc41c9qyj99j8pmwx12nsiapqxn27i"))))))
