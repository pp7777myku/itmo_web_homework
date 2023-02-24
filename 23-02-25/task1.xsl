<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://www.w3.org/1998/Math/MathML">
  
  <!-- Правило для обработки корневого элемента -->
  <xsl:template match="/">
    <math xmlns="http://www.w3.org/1998/Math/MathML">
      <xsl:apply-templates/>
    </math>
  </xsl:template>
  
  <!-- Правила для обработки элементов -->
  
  <xsl:template match="строка">
    <xsl:apply-templates/>
  </xsl:template>
  
  <xsl:template match="оператор">
    <mo><xsl:apply-templates/></mo>
  </xsl:template>
  
  <xsl:template match="операнд">
    <mi><xsl:apply-templates/></mi>
  </xsl:template>
  
  <xsl:template match="число">
    <mn><xsl:apply-templates/></mn>
  </xsl:template>
  
  <xsl:template match="низверх">
    <munderover>
      <mo><xsl:apply-templates/></mo>
      <mrow><xsl:apply-templates select="строка"/></mrow>
      <mrow><xsl:apply-templates select="верх"/></mrow>
    </munderover>
  </xsl:template>
  
  <xsl:template match="верх">
    <msup>
      <mrow><xsl:apply-templates/></mrow>
      <mrow><xsl:apply-templates select="строка"/></mrow>
    </msup>
  </xsl:template>
  
  <xsl:template match="дробь">
    <mfrac>
      <mrow><xsl:apply-templates select="строка[1]"/></mrow>
      <mrow><xsl:apply-templates select="строка[2]"/></mrow>
    </mfrac>
  </xsl:template>
  
  <xsl:template match="корень">
    <msqrt><xsl:apply-templates/></msqrt>
  </xsl:template>
  
  <xsl:template match="оператор[text() = '.']"/>
  
</xsl:stylesheet>
