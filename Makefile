TEX = platex
DVIPDF = dvipdfmx
MENDEX = mendex
BIBTEX = pbibtex
MAIN = master
#BODY = intro.tex detector.tex simulation.tex analysis.tex iso-butane.tex \
#       conclusion.tex acknowledge.tex abstract.tex collimator.tex scinti.tex
BODYDIR = body

all: ${MAIN}.pdf

${MAIN}.pdf: ${MAIN}.dvi
	$(DVIPDF) $<

${MAIN}.dvi: ${MAIN}.tex eps/*.eps ${MAIN}.bbl
	$(TEX) ${MAIN}.tex
#	$(MENDEX) $<
#	$(TEX) $<

${MAIN}.bbl: ${MAIN}.aux
	$(BIBTEX) ${MAIN}
	$(TEX) ${MAIN}.tex

${MAIN}.aux: ${MAIN}.tex
	$(TEX) ${MAIN}.tex

force:
	$(TEX) ${MAIN}.tex
	$(DVIPDF) ${MAIN}.dvi

intro: ${BODYDIR}/intro.pdf

${BODYDIR}/intro.pdf: ${BODYDIR}/intro.tex
	cd ${BODYDIR}/;\
	$(TEX) intro.tex;\
	$(DVIPDF) intro.dvi

detector: ${BODYDIR}/detector.pdf

${BODYDIR}/detector.pdf: ${BODYDIR}/detector.tex
	cd ${BODYDIR}/;\
	$(TEX) detector.tex;\
	$(DVIPDF) detector.dvi

simulation: ${BODYDIR}/simulation.pdf

${BODYDIR}/simulation.pdf: ${BODYDIR}/simulation.tex
	cd ${BODYDIR}/;\
	$(TEX) simulation.tex;\
	$(DVIPDF) simulation.dvi

analysis: ${BODYDIR}/analysis.pdf

${BODYDIR}/analysis.pdf: ${BODYDIR}/analysis.tex
	cd ${BODYDIR}/;\
	$(TEX) analysis.tex;\
	$(DVIPDF) analysis.dvi

iso-butane: ${BODYDIR}/iso-butane.pdf

${BODYDIR}/iso-butane.pdf: ${BODYDIR}/iso-butane.tex
	cd ${BODYDIR}/;\
	$(TEX) iso-butane.tex;\
	$(DVIPDF) iso-butane.dvi

conclusion: ${BODYDIR}/conclusion.pdf

${BODYDIR}/conclusion.pdf: ${BODYDIR}/conclusion.tex
	cd ${BODYDIR}/;\
	$(TEX) conclusion.tex;\
	$(DVIPDF) conclusion.dvi

abstract: ${BODYDIR}/abstract.pdf

${BODYDIR}/abstract.pdf: ${BODYDIR}/abstract.tex
	cd ${BODYDIR}/;\
	$(TEX) abstract.tex;\
	$(DVIPDF) abstract.dvi

acknowledge: ${BODYDIR}/acknowledge.pdf

${BODYDIR}/acknowledge.pdf: ${BODYDIR}/acknowledge.tex
	cd ${BODYDIR}/;\
	$(TEX) acknowledge.tex;\
	$(DVIPDF) acknowledge.dvi

scinti: ${BODYDIR}/scinti.pdf

${BODYDIR}/scinti.pdf: ${BODYDIR}/scinti.tex
	cd ${BODYDIR}/;\
	$(TEX) scinti.tex;\
	$(DVIPDF) scinti.dvi

collimator: ${BODYDIR}/collimator.pdf

${BODYDIR}/collimator.pdf: ${BODYDIR}/collimator.tex
	cd ${BODYDIR}/;\
	$(TEX) collimator.tex;\
	$(DVIPDF) collimator.dvi

drift-speed: ${BODYDIR}/drift-speed.pdf

${BODYDIR}/drift-speed.pdf: ${BODYDIR}/drift-speed.tex
	cd ${BODYDIR}/;\
	$(TEX) drift-speed.tex;\
	$(DVIPDF) drift-speed.dvi

clean:
	rm *.dvi *.log *.pdf *.aux *.bbl \
        ${BODYDIR}/*.dvi ${BODYDIR}/*.log ${BODYDIR}/*.pdf ${BODYDIR}/*.aux ${BODYDIR}/*.bbl

clean-master:
	rm *.dvi *.log *.pdf *.aux *.bbl

clean-body:
	rm ${BODYDIR}/*.dvi ${BODYDIR}/*.log ${BODYDIR}/*.pdf ${BODYDIR}*/.aus ${BODYDIR}/*.bbl
