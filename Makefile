FOP=/usr/bin/fop
FOPCONF=fop/fop.xconf

all:

%.pdf: %.fo
	$(FOP) -c $(FOPCONF) -pdf $@ -fo $<

ballots.xml: claims.tsv create-ballots.awk
	./create-ballots.awk < $< > $@

clean:
	rm -f *.pdf

