MPOST := mpost
LATEX := latex
MAGICK := magick

.DEFAULT_GOAL := default

.DELETE_ON_ERROR:

%-001.mps: %.mp
	$(MPOST) --tex=$(LATEX) $(<)

.PHONY: default all
default: all

.PHONY: mostlyclean clean
clean:: mostlyclean

mostlyclean::
	-rm -f *-001.mps
	-rm -f *.{mpx,log}
	-rm -f mpxerr.*

%-001.mps: %.mp
	$(MPOST) --tex=$(LATEX) $(<)

%.pdf: %-001.mps
	$(MAGICK) $(<) $(@)

%.png: %-001.mps
	$(MAGICK) $(<) -flatten $(@)

all:: doppler-transverse.pdf
clean::
	-rm -f doppler-transverse.pdf

all:: doppler-transverse.png
clean::
	-rm -f doppler-transverse.png
