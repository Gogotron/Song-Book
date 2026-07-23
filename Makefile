MAIN=song-book

SRCABC=$(wildcard tunes/*.abc)

all: once

thrice: once
	$(MAKE) -B $^
	$(MAKE) -B $^

once: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex $(SRCABC)
	pdflatex -interaction=batchmode --shell-escape $^

clean:
	rm -rf $(MAIN).pdf *.aux *.log tunes/*.ps tunes/*.eps tunes/*.pdf *.toc *.toc-*

.PHONY: all clean once thrice
