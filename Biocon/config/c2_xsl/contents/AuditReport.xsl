<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:fox="http://xml.apache.org/fop/extensions">
	<xsl:param name="PageTitle" />
	<xsl:param name="event_name" />
	<xsl:param name="user_name" />
	<xsl:param name="time_stamp" />
	<xsl:param name="string_1" />
	<xsl:param name="string_2" />
	<xsl:param name="string_3" />
	<xsl:param name="string_4" />
	<xsl:param name="string_5" />
	<xsl:param name="attribute_list" />
	<xsl:param name="version_label" />

	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<!-- defines the layout master -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first"
					reference-orientation="landscape" page-height="420mm" page-width="660mm"
					margin-top="1cm" margin-bottom="1cm" margin-left="1cm"
					margin-right="1cm">
					<fo:region-body margin-top="1cm" margin-bottom="1.5cm" />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<!-- starts actual layout -->
			<fo:page-sequence master-reference="first">
				<fo:flow flow-name="xsl-region-body">
					<!-- this defines a title level 2 -->
					<fo:block font-size="22pt" font-family="sans-serif"
						space-after.optimum="15pt" text-align="center" break-before="page"
						font-weight="bold">
						<xsl:value-of select="$PageTitle"></xsl:value-of>
						Audit Trail:
						<xsl:value-of select="root/dql1/row/object_name" />
					</fo:block>

					<!-- table start -->
					<fo:table text-align="left" space-before="1mm"
						border-collapse="collapse">

						<fo:table-header>
							<fo:table-row width="100%">
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="60mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$event_name" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="50mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$time_stamp" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="50mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$user_name" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="20mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$version_label" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="50mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$string_1" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="70mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$string_2" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="50mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$string_3" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="50mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$string_4" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="50mm">
									<fo:block wrap-option="wrap" padding="2mm">
										<xsl:value-of select="$string_5" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" font-weight="bold" background-color="#bbb"
									width="180mm">
									<fo:block wrap-option="wrap" padding="2mm" hyphenate="true">
										<xsl:value-of select="$attribute_list" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="root/dql2/row">
								<fo:table-row>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="event_name" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="time_stamp" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="user_name" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="center">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="version_label" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-align="center" text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="string_1" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left" wrap-option="wrap">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="string_2" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="string_3" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="string_4" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm">
											<xsl:call-template name="intersperse-with-zero-spaces">
												<xsl:with-param name="str" select="string_5" />
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left" wrap-option="wrap">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="0.5mm" hyphenate="true">
											<!--<xsl:call-template name="intersperse-with-zero-spaces"> <xsl:with-param 
												name="str" select="attribute_list"/> </xsl:call-template> -->
											<xsl:variable name="originalValue">
												<xsl:value-of select="attribute_list" />
												<xsl:variable name="attributeListID" select="attribute_list_id"/>
												<xsl:if
													test="attribute_list_id != '' and attribute_list_id != '0000000000000000'">
													<xsl:for-each select="/root/dql3/row">
													<xsl:variable name="objectID" select="r_object_id"/>
														<xsl:if test="$objectID=$attributeListID">
													
																<xsl:value-of select="current()/attribute_list" />
														</xsl:if>
														
													</xsl:for-each>
												</xsl:if>
											</xsl:variable>

											<xsl:call-template name="tokenize">
												<xsl:with-param name="input" select="$originalValue" />
											</xsl:call-template>
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
	<xsl:template name="intersperse-with-zero-spaces">
		<xsl:param name="str" />
		<xsl:variable name="spacechars">
			&#x9;&#xA;
			&#x2000;&#x2001;&#x2002;&#x2003;&#x2004;&#x2005;
			&#x2006;&#x2007;&#x2008;&#x2009;&#x200A;&#x200B;
		</xsl:variable>

		<xsl:if test="string-length($str) &gt; 0">
			<xsl:variable name="c1" select="substring($str, 1, 1)" />
			<xsl:variable name="c2" select="substring($str, 2, 1)" />

			<xsl:value-of select="$c1" />
			<xsl:if
				test="$c2 != '' and
				not(contains($spacechars, $c1) or
				contains($spacechars, $c2))">
				<xsl:text>&#x200B;</xsl:text>
			</xsl:if>

			<xsl:call-template name="intersperse-with-zero-spaces">
				<xsl:with-param name="str" select="substring($str, 2)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template name="tokenize">
		<xsl:param name="input" />
		<xsl:param name="length" select="6" />
		<xsl:call-template name="intersperse-with-zero-spaces">
			<xsl:with-param name="str" select="substring($input,1,$length)" />
		</xsl:call-template>
		<xsl:if test="substring($input,$length+1)">
			<xsl:call-template name="tokenize">
				<xsl:with-param name="input" select="substring($input,$length+1)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>