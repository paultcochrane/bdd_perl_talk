.PHONY: clean

BASENAME = bdd_perl
TEXNAME = $(BASENAME).tex

TEXFILES =

default: all

slides: $(BASENAME).pdf

$(BASENAME).pdf: $(TEXNAME) $(TEXFILES) vcs_beamer.cls
	pdflatex $<
	#pdflatex $<

all: slides

show:
	evince $(BASENAME).pdf 2> /dev/null &

clean:
	rm -f *.vrb *.log *.nav *.snm *.toc *.aux *.out *.dvi $(BASENAME).pdf

help:
	@echo "Possible targets: all, slides, show, clean"
