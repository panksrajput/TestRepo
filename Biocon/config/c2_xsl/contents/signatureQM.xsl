<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xml.apache.org/fop/extensions">
	<xsl:param name="UserLabel"/>
	<xsl:param name="DateLabel"/>		<xsl:param name="VersionLabel"/>
	<xsl:param name="ReasonLabel"/>		<xsl:param name="PageHeight_cm"/>		<xsl:param name="PageWidth_cm"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- defines the layout master -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first" page-height="{$PageHeight_cm}cm" page-width="{$PageWidth_cm}cm" margin-top="7cm" margin-bottom="5cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="1cm" margin-bottom="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!-- starts actual layout -->
			<fo:page-sequence master-reference="first">
				<fo:flow flow-name="xsl-region-body">
					<!-- table start -->
					<fo:table text-align="left" space-before="15mm" table-layout="fixed" border-collapse="collapse">
						<fo:table-column column-width="proportional-column-width(2)"/>
						<fo:table-column column-width="proportional-column-width(2)"/>
						<fo:table-column column-width="proportional-column-width(0.75)"/>												<fo:table-column column-width="proportional-column-width(2)"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">
									<fo:block padding="2mm"><xsl:value-of select="$UserLabel"/></fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">
									<fo:block padding="2mm"><xsl:value-of select="$DateLabel"/></fo:block>
								</fo:table-cell>																<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">									<fo:block padding="2mm"><xsl:value-of select="$VersionLabel"/></fo:block>								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">
									<fo:block padding="2mm"><xsl:value-of select="$ReasonLabel"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="root/dql1/row">
<!-- <xsl:sort select="substring(time_stamp,7,4)"/> year sort 
     <xsl:sort select="substring(time_stamp,1,2)"/>  month sort 
     <xsl:sort select="substring(time_stamp,4,2)"/> day sort 
     <xsl:sort select="substring(time_stamp,12,2)"/>  hour sort 
     <xsl:sort select="substring(time_stamp,15,2)"/>  minute sort    
     <xsl:sort select="substring(time_stamp,18,2)"/>  second sort -->

								<fo:table-row>
									<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left">
										<fo:block padding="2mm" text-indent="2mm">
											<xsl:value-of select="user_name"/>
									</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center">
										 <fo:block padding="2mm">
											<xsl:value-of select="time_stamp"/> (GMT)
										</fo:block>
									</fo:table-cell>																		<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center">										 <fo:block padding="2mm">											<xsl:value-of select="version_label"/>										</fo:block>									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center">
										<fo:block padding="2mm" text-indent="0.5mm">
											<xsl:value-of select="reason"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<!-- normal text -->
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
