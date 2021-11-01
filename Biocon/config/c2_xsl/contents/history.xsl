<?xml version="1.0" encoding="UTF-8"?>
<!-- edited with XMLSPY v5 U (http://www.xmlspy.com) by cap (gem) -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xml.apache.org/fop/extensions">
	<xsl:param name="Title"/>
	<xsl:param name="Text-Color"/>
	<xsl:param name="Font-size"/>
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- defines the layout master -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first" page-height="29.7cm" page-width="21cm" margin-top="5cm" margin-bottom="5cm" margin-left="2.5cm" margin-right="2.5cm">
					<fo:region-body margin-top="1cm" margin-bottom="1.5cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<!-- starts actual layout -->
			<fo:page-sequence master-reference="first">
				<fo:flow flow-name="xsl-region-body">
					<!-- this defines a title level 2-->
					<fo:block font-size="22pt" font-family="sans-serif" space-after.optimum="15pt" text-align="center" break-before="page" font-weight="bold">
						<xsl:value-of select="$Title"/>
					</fo:block>

					<!-- table start -->
					<fo:table text-align="left" space-before="15mm" table-layout="fixed" border-collapse="collapse">
						<fo:table-column column-width="proportional-column-width(0.75)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(4)"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">
									<fo:block padding="2mm">Version</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">
									<fo:block padding="2mm">Date</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center" font-weight="bold" background-color="#bbb">
									<fo:block padding="2mm">Description</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="root/dql1/row">
								<fo:table-row>
									<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center">
										<fo:block padding="2mm">
											<xsl:for-each select="r_version_label/r_version_label-value">
												<xsl:if test="number(.) or (.)='0.0'">
													<xsl:value-of select="."/>
												</xsl:if>
											</xsl:for-each>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid" text-align="center">
										<fo:block padding="2mm">
											<xsl:value-of select="r_modify_date"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-left="2mm" border-width="0.2mm" border-style="solid" text-align="left">
										<fo:block padding="2mm" wrap-option="no-wrap" linefeed-treatment="preserve" white-space-treatment="preserve" white-space-collapse="false"><xsl:value-of select="log_entry"/></fo:block>
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
