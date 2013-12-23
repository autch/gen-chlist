<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:dc="http://purl.org/dc/elements/1.1"
                              xmlns:dcterms="http://purl.org/dc/terms/">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:strip-space elements="channel-list channels physicalChannel service"/>
  
  <xsl:template match="/channel-list/channels[@type='BS']">
    <xsl:apply-templates select="meta"/>
    <xsl:text>static STATION bsSta[] = {
</xsl:text>
    <xsl:apply-templates select="physicalChannel/service"/>
    <xsl:text>};

static int bsStaCount = sizeof(bsSta) / sizeof (STATION);

</xsl:text>
  </xsl:template>

  <xsl:template match="/channel-list/channels[@type='CS']">
    <xsl:apply-templates select="meta"/>
    <xsl:text>static STATION csSta[] = {
</xsl:text>
    <xsl:apply-templates select="physicalChannel/service"/>
    <xsl:text>};

static int csStaCount = sizeof(csSta) / sizeof (STATION);

</xsl:text>
  </xsl:template>

  <xsl:template match="meta">
    <xsl:text>// 作成者：</xsl:text><xsl:value-of select="dcterms:creator"/><xsl:text>
</xsl:text>
    <xsl:text>// 作成日時：</xsl:text><xsl:value-of select="dcterms:created"/><xsl:text>
</xsl:text>
    <xsl:text>// 参照元：</xsl:text><xsl:value-of select="dc:source"/><xsl:text>
</xsl:text>
    <xsl:text>// 参照元の更新日時：</xsl:text><xsl:value-of select="dcterms:date"/><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="service">
    <xsl:text>  { "</xsl:text>
    <xsl:value-of select="name"/>
    <xsl:text>", "</xsl:text>
    <xsl:value-of select="ONTVname"/>
    <xsl:text>", </xsl:text>
    <xsl:value-of select="transportStreamID"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="originalNetworkID"/>
    <xsl:text>, </xsl:text>
    <xsl:value-of select="serviceID"/>
    <xsl:text> },
</xsl:text>
  </xsl:template>
</xsl:stylesheet>

