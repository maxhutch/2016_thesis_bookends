BASE = main
TARGET = Thesis
SLIDES=talk

thesis:
#	cp ~/Dropbox/writings/bib/library.bib .;
	latex --shell-escape -file-line-error ${TARGET}.tex;
	if [ -f ${TARGET}.aux ]; then bibtex ${TARGET}.aux; fi
	latex --shell-escape -file-line-error ${TARGET}.tex;
	latex --shell-escape -file-line-error ${TARGET}.tex;
	dvipdf ${TARGET}.dvi
	rm -f *.aux ${TARGET}.log ${TARGET}.blg ${TARGET}.dvi ;
	rm -f ${TARGET}Notes.bib
	cp ${TARGET}.pdf ~/Downloads/

talk:
	cp ~/Dropbox/writings/bib/library.bib .;
	pdflatex --shell-escape -file-line-error ${SLIDES}.tex;
	pdflatex --shell-escape -file-line-error ${SLIDES}.tex;

full:
	cp ../2016_smRTI_model/main.pdf model.pdf
	cp ../2016validation/main.pdf validation.pdf
	pdfseparate -f 1 -l 26 Thesis.pdf front-%03d.pdf
	pdfseparate -f 27  Thesis.pdf back-%03d.pdf
	pdfunite front*.pdf model.pdf validation.pdf convergence.pdf back*.pdf full.pdf
	rm front*.pdf back*.pdf
