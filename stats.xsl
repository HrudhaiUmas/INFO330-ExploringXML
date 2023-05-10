<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Find all Pokemon that fit particular attack/defense/speed values -->

<!-- The below rule will generate a comma-separated list from the 'type' nodes -->
<xsl:template match="type[position() != last()]"><xsl:value-of select="text()"/>, </xsl:template>
<xsl:template match="type[position() = last()]">
  <xsl:value-of select="text()"/>
</xsl:template>

<!--
  These rules will generate text output rather than text; these are useful for more easily
  figuring out if you got the "select" queries correct. Once you have that figured out,
  then update the HTML version of these rules below (and comment these out!) to see a nicely-
  formatted HTML file.
  -->
<xsl:template match="/pokedex">
    Strong attackers:
    <xsl:apply-templates select="pokemon[attack > 150]" />
    Strong defenders:
    <xsl:apply-templates select="pokemon[defense > 150]" />
    Fast:
    <xsl:apply-templates select="pokemon[speed > 150]" />
</xsl:template>

<xsl:template match="pokemon">
    <xsl:value-of select="./name" /> (<xsl:value-of select="@pokedexNumber" />): <xsl:apply-templates select="type" />
</xsl:template>

<!--
  These rules will generate HTML output rather than text. This is to demonstrate
  the power of using XSLT to create pretty output from XML sources.
  -->

  <xsl:template match="/pokedex">
    <html>
    <body>
      <h2>Strong Attackers</h2>
      <table border="1">
        <tr bgcolor="#9acd32">
          <th>Name</th>
          <th>Attack</th>
        </tr>
        <xsl:apply-templates select="pokemon[attack &gt; 150]" mode="attack" />
      </table>
      
      <h2>Strong Defenders</h2>
      <table border="1">
        <tr bgcolor="#9acd32">
          <th>Name</th>
          <th>Defense</th>
        </tr>
        <xsl:apply-templates select="pokemon[defense &gt; 150]" mode="defense" />
      </table>
      
      <h2>Fast Pokemon</h2>
      <table border="1">
        <tr bgcolor="#9acd32">
          <th>Name</th>
          <th>Speed</th>
        </tr>
        <xsl:apply-templates select="pokemon[speed &gt; 150]" mode="speed"/>
      </table>
    </body>
    </html>
  </xsl:template>

  <xsl:template match="pokemon" mode="attack">
  <tr>
    <td><xsl:value-of select="name" />(<xsl:value-of select="@pokedexNumber"/>)</td>
    <td><xsl:value-of select="attack" /></td>
  </tr>
</xsl:template>

<xsl:template match="pokemon" mode="defense">
  <tr>
    <td><xsl:value-of select="name" />(<xsl:value-of select="@pokedexNumber"/>)</td>
    <td><xsl:value-of select="defense" /></td>
  </tr>
</xsl:template>

<xsl:template match="pokemon" mode="speed">
  <tr>
    <td><xsl:value-of select="name" />(<xsl:value-of select="@pokedexNumber"/>)</td>
    <td><xsl:value-of select="speed" /></td>
  </tr>
</xsl:template>



</xsl:stylesheet>
