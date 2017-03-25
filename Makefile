FOP=/usr/bin/fop
FOPCONF=fop/fop.xconf

all:

%.pdf: %.fo
	$(FOP) -c $(FOPCONF) -pdf $@ -fo $<

clean:
	rm -f *.pdf

