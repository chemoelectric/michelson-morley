ASCDOC := asciidoctor
MPOST := mpost
LATEX := latex
MAGICK := magick
SCP := scp
WEBSITE := crudfact@crudfactory.com:www/website_3f7b2fcc

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

all:: doppler-longitudinal.png
veryclean::
	-rm -f doppler-longitudinal.png

all:: scale-equivalence.png
veryclean::
	-rm -f scale-equivalence.png

all:: ellipse.png
veryclean::
	-rm -f ellipse.png

all:: doppler1.png
veryclean::
	-rm -f doppler1.png

.PHONY: upload upload-html #upload-pdf
upload: upload-html #upload-pdf
upload-html: \
		michelson-morley.html \
		doppler-transverse.png \
		doppler-longitudinal.png \
		scale-equivalence.png \
		ellipse.png \
		doppler1.png \
		fieldtheory-20260710.151100.pdf \
		elliptic-model-of-doppler-shift.pdf \
		einstein-field-theory.pdf \
		fields1.pdf fields2.pdf \
		fields3.pdf fields4.pdf \
		bell-and-clauser-errors.pdf \
		stern-gerlach-eprb.pdf \
		two-channel-bell-1.pdf \
		two-channel-bell-2.pdf \
		two-channel-bell-3.pdf \
		led-model.pdf tunnel-diode-model.pdf \
		cmos-inverter-model.pdf \
		foxhole-detector-model.pdf \
		two-qubit-register-model.pdf
	$(SCP) $(<) $(WEBSITE)/index.html
	$(SCP) $(filter %.png %.pdf,$(^)) $(WEBSITE)/
#upload-pdf:
#	$(SCP) $(^) $(WEBSITE)
