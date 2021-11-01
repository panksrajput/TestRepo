<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xml.apache.org/fop/extensions">
	<xsl:param name="title-toc"/>
	<xsl:param name="depth-toc" select="0.5"/>
	<xsl:param name="separatorStyle" select="'dots'"/>

	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first" page-width="21cm" page-height="29.7cm" margin-top="3cm" margin-bottom="3cm" margin-left="2cm" margin-right="2cm">
				<fo:region-body/>
				<fo:region-before extent="3cm"/>
				<fo:region-after extent="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="first">
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-weight="bold" font-size="24pt" padding-bottom="0.5cm"><xsl:value-of select="$title-toc"/></fo:block>
					<xsl:apply-templates select="root/object" mode="toc"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	<xsl:template match="root/object" mode="toc">
	<xsl:variable name="indentation" select="concat(depth * number($depth-toc), 'cm')"/>

		<fo:block text-align-last="justify" padding-after="6pt"><xsl:attribute name="start-indent"><xsl:value-of select="$indentation"/></xsl:attribute>
		<xsl:if test=". = 0">
			<xsl:attribute name="font-weight">bold</xsl:attribute>
		</xsl:if>
			<fo:basic-link internal-destination="{page}">
				<xsl:value-of select="title"/>
			</fo:basic-link>
			<fo:leader>
				<xsl:attribute name="leader-pattern"><xsl:value-of select="$separatorStyle"/></xsl:attribute>
			</fo:leader>
			<xsl:value-of select="page"/>
		</fo:block>
	</xsl:template>

</xsl:stylesheet>
