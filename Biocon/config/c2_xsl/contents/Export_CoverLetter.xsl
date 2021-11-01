<?xml version="1.0" encoding="UTF-8" ?>
	<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fox="http://xml.apache.org/fop/extensions">
		<xsl:param name="PageTitle"/>
		<xsl:param name="UserExportLabel"/>
		<xsl:param name="DateRequestedLabel"/>
		<xsl:param name="ObjectLabel"/>
		<xsl:param name="ControlledCopyLabel"/>
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
						<fo:block font-size="22pt" font-family="sans-serif" space-after.optimum="15pt" text-align="left" break-before="page" font-weight="bold">
							<xsl:value-of select="$PageTitle"/>
						</fo:block>						
						<!-- table start -->
						<fo:table text-align="left" space-before="15mm" border-collapse="collapse">
							<!--<fo:table-column column-width="proportional-column-width(2)"/>
							<fo:table-column column-width="proportional-column-width(0.75)"/>
							<fo:table-column column-width="proportional-column-width(2)"/>-->
							<fo:table-body>
								<xsl:for-each select="root/dql1/row">
									<fo:table-row>
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left" font-weight="bold" background-color="#bbb">
											<fo:block padding="2mm"><xsl:value-of select="$UserExportLabel"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left">
											<fo:block padding="2mm" text-indent="2mm">
												<xsl:value-of select="user_name"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>	
									<fo:table-row>
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left" font-weight="bold" background-color="#bbb">
										<fo:block padding="2mm"><xsl:value-of select="$ObjectLabel"/></fo:block>
									</fo:table-cell>
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left">
											<fo:block padding="2mm" text-indent="0.5mm">
												<xsl:value-of select="object_name"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>	
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left" font-weight="bold" background-color="#bbb">
											<fo:block padding="2mm"><xsl:value-of select="$DateRequestedLabel"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left">
											<fo:block padding="2mm" text-indent="0.5mm">
												<xsl:value-of select="time_stamp"/>
											</fo:block>
										</fo:table-cell>
									</fo:table-row>
									<fo:table-row>	
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left" font-weight="bold" background-color="#bbb">
											<fo:block padding="2mm"><xsl:value-of select="$ControlledCopyLabel"/></fo:block>
										</fo:table-cell>
										<fo:table-cell border-width="0.2mm" border-style="solid" text-align="left">
											<fo:block padding="2mm" text-indent="0.5mm">
												<xsl:value-of select="effective_date"/>
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
