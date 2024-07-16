(define-module (brandhout packages python-xyz)
  #:use-module (gnu packages)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages base)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages check)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-check)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages libffi)
  #:use-module (gnu packages xml)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system python)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))

(define-public python-rtmidi
  (package
   (name "python-rtmidi")
   (version "1.5.8")
   (source (origin
            (method url-fetch)
            (uri (pypi-uri "python_rtmidi" version))
            (sha256
             (base32
              "1yh4s124awzwhfg49m8s6qsa58qxabljlmnb1q00kbk8n1ldx6kz"))))
   (build-system meson-build-system)

   (inputs 
    (list 
     python 
     glibc 
     python-cffi 
     jack-2 
     boost 
     rtmidi))
					; TODO
					;(native-input (list python-cffi python-setuptools))
   (native-inputs (list python-pytest pkg-config python-setuptools))
   (home-page "https://pypi.org/project/python-rtmidi/")
   (synopsis "Python bindings for RtMidi")
   (description
    "Python-rtmidi is a Python binding for RtMidi, a set of C++ classes that provides a common API for real-time MIDI input/output across Linux (ALSA & JACK), macOS, and Windows (Multimedia Library).")
   (license license:expat)))
