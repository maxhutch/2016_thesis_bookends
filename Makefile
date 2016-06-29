BASE = main
TARGET = Thesis

executive:
	cp ~/Dropbox/writings/bib/library.bib .;
	latex --shell-escape -file-line-error ${TARGET}.tex;
	if [ -f ${TARGET}.aux ]; then bibtex ${TARGET}.aux; fi
	latex --shell-escape -file-line-error ${TARGET}.tex;
	latex --shell-escape -file-line-error ${TARGET}.tex;
	dvipdf ${TARGET}.dvi
	rm -f *.aux ${TARGET}.log ${TARGET}.blg ${TARGET}.dvi ;
	rm -f ${TARGET}Notes.bib

