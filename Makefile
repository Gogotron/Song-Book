MAIN=main

SRCABC=$(wildcard tunes/*.abc)

all: once

twice: once
	$(MAKE) -B $^

once: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(SRCABC)
	pdflatex -interaction=batchmode --shell-escape $^

clean:
	rm -rf $(MAIN).pdf *.aux *.log tunes/*.ps tunes/*.eps tunes/*.pdf *.toc

.PHONY: all clean
