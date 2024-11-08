(define-module (brandhout packages lighting)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses)
                #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages check)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages libftdi)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages python-science)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf))

(define-public open-lighting-console
  (let ((commit "e8393295f4a656dab87cbd63b6be8faad48d4c1b"))
    (package
      (name "open-lighting-console")
      (version "0.92.beta")
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/mikacousin/olc")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "02w1n5w12ylw14qvhm50576zcksw74saynfvn2gswc7hsggp32if"))))
      (build-system meson-build-system)
      (arguments
       `(#:phases (modify-phases %standard-phases
                    ;; Add a phase to remove the meson.add_install_script line
                    (add-before 'configure 'remove-install-script
                      (lambda _
                        (substitute* "meson.build"
                          (("meson.add_install_script\\('build-aux/meson/postinstall.py'\\)")
                           "")))))))
      (propagated-inputs (list gtk+ ;gtk3
                               python-pygobject
                               gobject-introspection
                               ola
                               python-sacn
                               python-mido
                               python-pycairo
                               python-pyliblo
                               python-scipy
                               python-charset-normalizer))
      (inputs (list python))
      ;; (native-inputs
      ;; (list pkg-config ("glib:bin" ,glib "bin")))
      (native-inputs `(("gettext" ,gettext-minimal)
                       ("glib:bin" ,glib "bin")
                       ("pkg-config" ,pkg-config)))
      (home-page "https://example.com/open-lighting-console")
      (synopsis "Open Lighting Console for controlling lighting systems")
      (description
       "Open Lighting Console is an application for controlling lighting systems. It supports various protocols and devices.")
      (license license:gpl3))))
