<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:dc="http://purl.org/dc/elements/1.1"
                              xmlns:dcterms="http://purl.org/dc/terms/">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:strip-space elements="channel-list channels physicalChannel service"/>

  <xsl:template match="/">
    <xsl:apply-templates select="*"/>
  </xsl:template>
  
  <xsl:template match="/channel-list/channels[@type='BS']">
    <xsl:text># 全国用 BS デジタルチャンネルマップ
</xsl:text>
    <xsl:apply-templates select="meta"/>
    <xsl:apply-templates select="physicalChannel/service[not(@type) or (@type != 'radio' and @type != 'data')]"/>
  </xsl:template>

  <xsl:template match="/channel-list/channels[@type='CS']">
    <xsl:text># 全国用 CS デジタルチャンネルマップ
</xsl:text>
    <xsl:apply-templates select="meta"/>
    <xsl:apply-templates select="physicalChannel/service[not(@type) or (@type != 'radio' and @type != 'data')]"/>
  </xsl:template>

  <xsl:template match="meta">
    <xsl:text># 作成者：</xsl:text><xsl:value-of select="dcterms:creator"/><xsl:text>
</xsl:text>
    <xsl:text># 作成日時：</xsl:text><xsl:value-of select="dcterms:created"/><xsl:text>
</xsl:text>
    <xsl:text># 参照元：</xsl:text><xsl:value-of select="dc:source"/><xsl:text>
</xsl:text>
    <xsl:text># 参照元の更新日時：</xsl:text><xsl:value-of select="dcterms:date"/><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="bs-channel-list" match="/channel-list/channels[@type='BS']/physicalChannel/service">
    <xsl:text>- name: </xsl:text><xsl:value-of select="name"/><xsl:text>
</xsl:text>
    <xsl:text>  type: BS
</xsl:text>
    <xsl:text>  channel: BS</xsl:text><xsl:value-of select="../@id"/><xsl:text>_</xsl:text><xsl:value-of select="count(./preceding-sibling::*)"/><xsl:text>
</xsl:text>
    <xsl:text>  serviceId: </xsl:text><xsl:value-of select="serviceID"/><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template name="cs-channel-list" match="/channel-list/channels[@type='CS']/physicalChannel/service">
    <xsl:text>- name: </xsl:text><xsl:value-of select="name"/><xsl:text>
</xsl:text>
    <xsl:text>  type: CS
</xsl:text>
    <xsl:text>  channel: CS</xsl:text><xsl:value-of select="../@id"/><xsl:text>
</xsl:text>
    <xsl:text>  serviceId: </xsl:text><xsl:value-of select="serviceID"/><xsl:text>
</xsl:text>
    <xsl:text>  isDisabled: true
</xsl:text>
  </xsl:template>
</xsl:stylesheet>

