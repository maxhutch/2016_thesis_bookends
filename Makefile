BASE = main
TARGET = Thesis
SLIDES=talk

thesis:
	cp ~/Dropbox/writings/bib/library.bib .;
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
