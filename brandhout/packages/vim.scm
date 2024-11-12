(define-module (gnu packages vim)
#:use-module ((guix licenses) #:prefix license:)
#:use-module (guix packages)
#:use-module (guix gexp)
#:use-module (guix utils)
#:use-module (guix download)
#:use-module (guix git-download)
#:use-module (guix build-system cmake)
#:use-module (guix build-system copy)
#:use-module (guix build-system gnu)
#:use-module (guix build-system python)
#:use-module (guix build-system pyproject)
#:use-module (guix build-system vim)
#:use-module (gnu packages)
#:use-module (gnu packages acl)
#:use-module (gnu packages admin) ; For GNU hostname
#:use-module (gnu packages attr)
#:use-module (gnu packages autotools)
#:use-module (gnu packages base)
#:use-module (gnu packages check)
#:use-module (gnu packages code)
#:use-module (gnu packages coq)
#:use-module (gnu packages enlightenment)
#:use-module (gnu packages fontutils)
#:use-module (gnu packages gawk)
#:use-module (gnu packages gettext)
#:use-module (gnu packages glib)
#:use-module (gnu packages gperf)
#:use-module (gnu packages groff)
#:use-module (gnu packages gtk)
#:use-module (gnu packages image)
#:use-module (gnu packages jemalloc)
#:use-module (gnu packages libevent)
#:use-module (gnu packages linux)
#:use-module (gnu packages lisp-xyz)
#:use-module (gnu packages lua)
#:use-module (gnu packages ncurses)
#:use-module (gnu packages perl)
#:use-module (gnu packages pkg-config)
#:use-module (gnu packages python)
#:use-module (gnu packages python-xyz)
#:use-module (gnu packages ruby)
#:use-module (gnu packages serialization)
#:use-module (gnu packages shells)
#:use-module (gnu packages tcl)
#:use-module (gnu packages text-editors)
#:use-module (gnu packages terminals)
#:use-module (gnu packages tree-sitter)
#:use-module (gnu packages xdisorg)
#:use-module (gnu packages icu4c)
#:use-module (gnu packages xorg))

(define-public neovim
(package
  (name "neovim")
  (version "0.10.2")
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/neovim/neovim")
                  (commit (string-append "v" version))))
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0r5mjfsgrllxi44i9k6lb8b99rpzrwhkg18aiqmby8wwzflbqdy3"))))
  (build-system cmake-build-system)
  (arguments
   (list #:modules
         '((srfi srfi-26) (guix build cmake-build-system)
           (guix build utils))
         #:configure-flags
         #~(list #$@(if (member (if (%current-target-system)
                                    (gnu-triplet->nix-system (%current-target-system))
                                    (%current-system))
                                (package-supported-systems luajit))
                        '()
                        '("-DPREFER_LUA:BOOL=YES")))
         #:phases
         #~(modify-phases %standard-phases
             (add-after 'unpack 'set-lua-paths
               (lambda* _
                 (let* ((lua-version "5.1")
                        (lua-cpath-spec (lambda (prefix)
                                          (let ((path (string-append
                                                       prefix
                                                       "/lib/lua/"
                                                       lua-version)))
                                            (string-append
                                             path
                                             "/?.so;"
                                             path
                                             "/?/?.so"))))
                        (lua-path-spec (lambda (prefix)
                                         (let ((path (string-append prefix
                                                      "/share/lua/"
                                                      lua-version)))
                                           (string-append path "/?.lua;"
                                                          path "/?/?.lua"))))
                        (lua-inputs (list (or #$(this-package-input "lua")
                                              #$(this-package-input "luajit"))
                                          #$lua5.1-luv
                                          #$lua5.1-lpeg
                                          #$lua5.1-bitop
                                          #$lua5.1-libmpack)))
                   (setenv "LUA_PATH"
                           (string-join (map lua-path-spec lua-inputs) ";"))
                   (setenv "LUA_CPATH"
                           (string-join (map lua-cpath-spec lua-inputs) ";"))
                   #t)))
             (add-after 'unpack 'prevent-embedding-gcc-store-path
               (lambda _
                 ;; nvim remembers its build options, including the compiler with
                 ;; its complete path.  This adds gcc to the closure of nvim, which
                 ;; doubles its size.  We remove the reference here.
                 (substitute* "cmake.config/versiondef.h.in"
                   (("\\$\\{CMAKE_C_COMPILER\\}") "/gnu/store/.../bin/gcc"))
                 #t)))))
  (inputs (list libuv-for-luv
                msgpack
                libtermkey
                libvterm
                unibilium
                jemalloc
                (if (member (if (%current-target-system)
                                (gnu-triplet->nix-system (%current-target-system))
                                (%current-system))
                            (package-supported-systems luajit))
                    luajit
                    lua-5.1)
                lua5.1-luv
                lua5.1-lpeg
                lua5.1-bitop
                lua5.1-libmpack
                tree-sitter))
  (native-inputs (list pkg-config gettext-minimal gperf))
  (home-page "https://neovim.io")
  (synopsis "Fork of vim focused on extensibility and agility")
  (description
   "Neovim is a project that seeks to aggressively
refactor Vim in order to:

@itemize
@item Simplify maintenance and encourage contributions
@item Split the work between multiple developers
@item Enable advanced external UIs without modifications to the core
@item Improve extensibility with a new plugin architecture
@end itemize
")
  ;; Neovim is licensed under the terms of the Apache 2.0 license,
  ;; except for parts that were contributed under the Vim license.
  (license (list license:asl2.0 license:vim))))

(define-public tree-sitter
(package
  (name "tree-sitter")
  (version "0.24.4")                 ;untagged
  (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/tree-sitter/tree-sitter")
                (commit (string-append "v" version))))              
            (file-name (git-file-name name version))
            (sha256
             (base32
              "0z6d8xfpf9dr8s5vz12lfx8wfw0820r3wiqnwkk34kr87w9lz28c"))
            (modules '((guix build utils)))
            (snippet #~(begin
                         ;; Remove bundled ICU parts
                         (delete-file-recursively "lib/src/unicode")))))
  (build-system gnu-build-system)
  (inputs (list icu4c))
  (arguments
   (list #:phases
         #~(modify-phases %standard-phases
             (delete 'configure))
         #:tests? #f ; there are no tests for the runtime library
         #:make-flags
         #~(list (string-append "PREFIX=" #$output)
                 (string-append "CC=" #$(cc-for-target)))))
  (home-page "https://tree-sitter.github.io/tree-sitter/")
  (synopsis "Incremental parsing system for programming tools")
  (description
   "Tree-sitter is a parser generator tool and an incremental parsing
library.  It can build a concrete syntax tree for a source file and
efficiently update the syntax tree as the source file is edited.

Tree-sitter aims to be:

@itemize
@item General enough to parse any programming language
@item Fast enough to parse on every keystroke in a text editor
@item Robust enough to provide useful results even in the presence of syntax errors
@item Dependency-free so that the runtime library (which is written in pure C)
can be embedded in any application
@end itemize

This package includes the @code{libtree-sitter} runtime library.")
  (license license:expat)))