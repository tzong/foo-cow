XSLTPROC=/usr/bin/xsltproc
XMLLINT=/usr/bin/xmllint
FOP=/usr/bin/fop
FOPCONF=fop/fop.xconf

all: ballots.pdf

%.pdf: %.fo
	$(FOP) -c $(FOPCONF) -pdf $@ -fo $<

ballots.xml: claims.tsv create-ballots.awk
	./create-ballots.awk < $< > $@

ballots.fo: meeting.xml ballots.xml ballots.xsl
	$(XSLTPROC) --xinclude ballots.xsl $< | $(XMLLINT) --format - > $@

clean:
	rm -f *.pdf
	rm -f ballots.fo ballots.xml
