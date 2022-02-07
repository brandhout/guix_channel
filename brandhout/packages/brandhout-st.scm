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
          (commit "5ff2f99ba05fd3f8f5a81aed96319fe704cbc939")))
        (sha256
          (base32 "1rjv2wascds3r90gv7nrlgy2iqiqrmic48jc1sb9fgz45vh28plk"))))))
