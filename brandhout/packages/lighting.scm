;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016 John J. Foerch <jjfoerch@earthlink.net>
;;; Copyright © 2017, 2018, 2020 Tobias Geerinckx-Rice <me@tobias.gr>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (brandhout packages lighting)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix gexp)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
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

(define-public ola
  (package
    (name "ola")
    (version "0.10.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/OpenLightingProject/ola")
             (commit version)))
       (sha256
        (base32 "0mbf5dc309pqg9ckqgk2kh9p3mf9vqsjkxnwjzqw7yzzf17ij3zk"))
       (file-name (git-file-name name version))))
    (build-system gnu-build-system)
    (native-inputs
     (list bison
           cppunit
           flex
           pkg-config
           ;; For git repository bootstrapping.
           autoconf
           automake
           libtool))
    (inputs
     (list libftdi
           libmicrohttpd
           libusb
           `(,util-linux "lib")
           zlib))
    (propagated-inputs
     (list protobuf))       ; for pkg-config --libs libola
    (arguments
     (list
      ;; G++ >= 4.8 macro expansion tracking requires lots of memory, causing
      ;; build to fail on low memory systems.  We disable that with the
      ;; following configure flags.
      #:configure-flags #~(list "CXXFLAGS=-ftrack-macro-expansion=0")))
    (synopsis "Framework for controlling entertainment lighting equipment")
    (description "The Open Lighting Architecture is a framework for lighting
control information.  It supports a range of protocols and over a dozen USB
devices.  It can run as a standalone service, which is useful for converting
signals between protocols, or alternatively using the OLA API, it can be used
as the backend for lighting control software.  OLA runs on many different
platforms including ARM, which makes it a perfect fit for low cost Ethernet to
DMX gateways.")
    (home-page "https://www.openlighting.org/ola")
    (license license:lgpl2.1+)))

(define-public open-lighting-console
  (let ((commit "e8393295f4a656dab87cbd63b6be8faad48d4c1b"))
  (package
    (name "open-lighting-console")
    (version "0.92.beta") ; replace with the actual version
    (source
      (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/mikacousin/olc")
                    (commit commit)))
              (file-name (git-file-name name version))
                            (sha256
               (base32
                "02w1n5w12ylw14qvhm50576zcksw74saynfvn2gswc7hsggp32if"))))
    (build-system meson-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         ;; Add a phase to remove the meson.add_install_script line
         (add-before 'configure 'remove-install-script
           (lambda _
             (substitute* "meson.build"
               (("meson.add_install_script\\('build-aux/meson/postinstall.py'\\)")
                "")))))))
    (propagated-inputs
     (list gtk+ ; gtk3
           python-pygobject
           gobject-introspection
           ola
           python-sacn
           python-mido
           python-pycairo
           python-pyliblo
           python-scipy
           python-charset-normalizer))
    (inputs
      (list python ))
;    (native-inputs
;     (list pkg-config ("glib:bin" ,glib "bin")))
    (native-inputs
     `(("gettext" ,gettext-minimal)
       ("glib:bin" ,glib "bin")
       ("pkg-config" ,pkg-config)))
    (home-page "https://example.com/open-lighting-console")
    (synopsis "Open Lighting Console for controlling lighting systems")
    (description "Open Lighting Console is an application for controlling lighting systems. It supports various protocols and devices.")
    (license gpl3))) )
