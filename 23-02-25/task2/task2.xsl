<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<svg xmlns="http://www.w3.org/2000/svg"
      version="1.1"
      width="{root/графика/@ширина}"
      height="{root/графика/@высота}">
<xsl:apply-templates select="root/графика/*"/>
</svg>
</xsl:template>

<xsl:template match="эллипс">
<ellipse id="{@id}"
          fill-opacity="{substring-after(@заливка,',')}"
          fill="{getFillColor(@заливка)}"
          stroke="{@ободок}"
          stroke-width="{@ширина-ободка}"
          cx="{@cx}"
          cy="{@cy}"
          rx="{@rx}"
          ry="{@ry}" />
</xsl:template>

<xsl:param name="fillAttr" />
<xsl:value-of select="concat('rgb(', replace(substring-after($fillAttr, '('), ',', ', '),
replace(substring-before(substring-after($fillAttr, ','), ','), ',', ', '),
replace(substring-before(substring-after($fillAttr, ',', 2), ','), ',', ''), ')')" />
</xsl:function>

</xsl:stylesheet>
