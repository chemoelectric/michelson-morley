ASCDOC := asciidoctor
MPOST := mpost
LATEX := latex
MAGICK := magick

.DEFAULT_GOAL := default

.DELETE_ON_ERROR:

%-001.mps: %.mp
	$(MPOST) --tex=$(LATEX) $(<)

.PHONY: default all
default: all

.PHONY: mostlyclean clean veryclean
clean:: mostlyclean
veryclean:: clean

mostlyclean::
	-rm -f *-001.mps
	-rm -f *.{mpx,log}
	-rm -f mpxerr.*

%.html: %.adoc
	$(ASCDOC) -b html5 -S safe $(<) -o $(@)

%-001.mps: %.mp
	$(MPOST) --tex=$(LATEX) $(<)

%.png: %-001.mps
	$(MAGICK) $(<) $(@)

all:: michelson-morley.html
veryclean::
	-rm -f michelson-morley.html

all:: doppler-transverse.png
veryclean::
	-rm -f doppler-transverse.png

all:: scale-equivalence.png
veryclean::
	-rm -f scale-equivalence.png
