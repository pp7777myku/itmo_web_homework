<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="{root/графика/@ширина}" height="{root/графика/@высота}">
      <xsl:apply-templates select="root/графика/*"/>
    </svg>
  </xsl:template>

  <xsl:template match="эллипс">
    <ellipse id="{@id}" fill-opacity="{substring-after(@заливка,',')}" fill="rgb({substring-before(substring-after(@заливка,'('),',')}, {substring-before(substring-after(@заливка,','),',')}, {substring-before(substring-after(@заливка,',',2),',')})" stroke="{@ободок}" stroke-width="{@ширина-ободка}" cx="{@cx}" cy="{@cy}" rx="{@rx}" ry="{@ry}" />
  </xsl:template>
</xsl:stylesheet>
