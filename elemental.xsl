<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- "Find all Pokemon that have a type of "fire", "water", "flying", or "ground" -->
<!-- SELECT COUNT(*) FROM pokemon_types_view 
     WHERE type1 IN ('fire', 'water', 'flying', 'ground') 
        OR type2 IN ('fire', 'water', 'flying', 'ground') = 328 Pokemon -->

<xsl:template match="type[position() != last()]"><xsl:value-of select="text()"/>, </xsl:template>
<xsl:template match="type[position() = last()]">
  <xsl:value-of select="text()"/>
</xsl:template>

<!--
  These rules will generate HTML output rather than text. This is to demonstrate
  the power of using XSLT to create pretty output from XML sources.
  -->
<xsl:template match="/pokedex">
  <xsl:variable name="pokemonResults" select="pokemon[type='fire' or type='water' or type='flying' or type='ground']" />

  <html>
  <body>
  <h2>Elemental Pokemon</h2>
  A total of <xsl:value-of select="count($pokemonResults)" />:
  <table border="1">
    <tr bgcolor="#9acd32">
      <th>Name</th>
      <th>Type(s)</th>
    </tr>
    <xsl:apply-templates select="$pokemonResults" />
  </table>
  </body>
  </html>
</xsl:template>

<xsl:template match="pokemon">
    <tr>
      <td><xsl:value-of select="./name" />(<xsl:value-of select="@pokedexNumber" />)</td>
      <td><xsl:apply-templates select="type" /></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
