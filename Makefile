TEX=platex
DVIPDF=dvipdfmx
MENDEX=mendex
BIBTEX=pbibtex
TARGET=master

all: ${TARGET}.pdf

${TARGET}.pdf: ${TARGET}.dvi
	$(DVIPDF) $<

${TARGET}.dvi: ${TARGET}.tex eps/*.eps ${TARGET}.bbl
	$(TEX) $<
#	$(MENDEX) $<
#	$(TEX) $<

${TARGET}.bbl: ${TARGET}.aux
	$(TEX) ${TARGET}.tex
	$(BIBTEX) ${TARGET}
	$(TEX) ${TARGET}.tex

${TARGET}.aux: ${TARGET}.tex
	$(TEX) ${TARGET}.tex

force2:
	$(TEX) ${TARGET}.tex
	$(TEX) ${TARGET}.tex
	$(DVIPDF) ${TARGET}.dvi

clean:
	rm ${TARGET}.dvi ${TARGET}.log ${TARGET}.pdf ${TARGET}.aux
