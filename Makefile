
XSLTPROC=xsltproc
SOURCE=channel-list.xml

all: epgdump-chlist.c epgrec-chlist.php mirakurun-channel.yaml

epgdump-chlist.c: $(SOURCE) gen-epgdump.xsl
	$(XSLTPROC) -o $@ gen-epgdump.xsl $(SOURCE)

epgrec-chlist.php: $(SOURCE) gen-epgrec.xsl
	$(XSLTPROC) -o $@ gen-epgrec.xsl $(SOURCE)

mirakurun-channel.yaml: $(SOURCE) gen-mirakurun.xsl
	$(XSLTPROC) -o $@ gen-mirakurun.xsl $(SOURCE)
