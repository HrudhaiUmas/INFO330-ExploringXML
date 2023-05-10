<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Find all Pokemon that have a type of "fire" -->
<!-- select count(*) from pokemon_types_view where type1 = 'fire' OR type2 = 'fire' = 64 -->

<!-- This generates a comma-separated list for the Pokemon types; 'grass, poison' or 'normal' -->
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
    <h2>All Fire-type Pokemon</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>Name</th>
        <th>Types</th>
      </tr>
      <xsl:apply-templates select="pokemon[type='fire']" />
    </table>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="pokemon">
      <tr>
        <td><xsl:value-of select="name" />(<xsl:value-of select="@classification" />)</td>
        <td><xsl:apply-templates select="type" /></td>
      </tr>
  </xsl:template>
 

</xsl:stylesheet>
