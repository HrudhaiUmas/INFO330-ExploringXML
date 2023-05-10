<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- The result of this stylesheet should be 384 Pokemon -->

<xsl:template match="type[position() != last()]"><xsl:value-of select="text()"/>, </xsl:template>
<xsl:template match="type[position() = last()]">
  <xsl:value-of select="text()"/>
</xsl:template>

<!--
  These rules will generate HTML output rather than text. This is to demonstrate
  the power of using XSLT to create pretty output from XML sources.
-->

  <xsl:template match="/pokedex">
    <html>
    <body>
    <h2>Single-type Pokemon</h2>
    Count: <xsl:value-of select="count(pokemon[count(type) = 1])" />
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Name</th>
        <th>Classification</th>
        <th>Type</th>
      </tr>
      <xsl:apply-templates select="pokemon[count(type) = 1]" />
    </table>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="pokemon">
      <tr>
        <td><xsl:value-of select="./name" />(<xsl:value-of select="@pokedexNumber" />)</td>
        <td><xsl:value-of select="./@classification" /></td>
        <td><xsl:value-of select="./type" /></td>
      </tr>
  </xsl:template>


</xsl:stylesheet>
