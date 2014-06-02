.PHONY: clean help

BASENAME = bdd_perl
TEXNAME = $(BASENAME).tex

default: all

slides: $(BASENAME).pdf

$(BASENAME).pdf: $(TEXNAME) $(TEXFILES) vcs_beamer.cls
	pdflatex $<

all: slides

show:
	evince $(BASENAME).pdf 2> /dev/null &

clean:
	rm -f *.vrb *.log *.nav *.snm *.toc *.aux *.out $(BASENAME).pdf

help:
	@echo "Possible targets: all, slides, show, clean"
