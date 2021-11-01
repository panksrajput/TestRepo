<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:fox="http://xml.apache.org/fop/extensions">
	<xsl:param name="PageTitle" />
	<xsl:param name="ReportTime" />
	<xsl:param name="DocumentVersion" />
	<xsl:param name="ReportTableName1" />
	<xsl:param name="ReportTableName2" />
	<xsl:param name="UserName" />
	<xsl:param name="UserLoginName" />
	<xsl:param name="EventName" />
	<xsl:param name="TBRSentDate" />
	<xsl:param name="TBRCompletionDate" />
	<xsl:template match="/">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		
      		<!-- defines the layout master -->
			<fo:layout-master-set>
				<fo:simple-page-master master-name="first"
					reference-orientation="landscape" page-height="500mm" page-width="400mm"
					margin-top="1cm" margin-bottom="1cm" margin-left="2cm"
					margin-right="1cm">
					<fo:region-body margin-top="1cm" margin-bottom="1.5cm"
						margin-left="2cm" />
				</fo:simple-page-master>
			</fo:layout-master-set>
      		<!-- starts actual layout -->
			<fo:page-sequence master-reference="first">
				<fo:flow flow-name="xsl-region-body">
				
          			<!-- this defines a title level 2-->
					<fo:table width="100%">
						<fo:table-body>
							<fo:table-row width="100%">
								<fo:table-cell text-align="left" font-weight="15pt">
									<fo:block font-size="22pt" font-weight="bold">
										<xsl:value-of select="$PageTitle" />
										:
										<xsl:value-of select="root/dql1/row/object_name" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row width="100%">
								<fo:table-cell text-align="left" font-weight="15pt">
									<fo:block font-size="22pt" font-weight="bold">
										<xsl:value-of select="$DocumentVersion" />
										:
										<xsl:value-of select="root/dql1/row/r_version_label" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row width="100%">
								<fo:table-cell text-align="left" font-weight="15pt">
									<fo:block font-size="22pt" font-weight="bold">
										<xsl:value-of select="$ReportTime" />
										:
										<xsl:value-of select="root/dql1/row/report_time" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:block font-size="22pt">
						<fo:leader />
					</fo:block>
					<fo:block font-size="22pt">
						<fo:leader />
					</fo:block>
					<!-- This defines the first section of the report-->
					<xsl:text xml:space="preserve" />
					<fo:block font-size="22pt" font-weight="bold">
						<xsl:value-of select="$ReportTableName1" />
						:
					</fo:block>
					<fo:table text-align="left" space-before="1mm"
						border-collapse="collapse" width="75%">
						<fo:table-column column-width="proportional-column-width(8)" />
						<fo:table-column column-width="proportional-column-width(8)" />
						<fo:table-column column-width="proportional-column-width(8)" />
						<fo:table-column column-width="proportional-column-width(8)" />
						<fo:table-header>
							<fo:table-row width="100%">
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$UserName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$UserLoginName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$EventName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$TBRCompletionDate" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="root/dql2/row">
								<fo:table-row>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="user_name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="user_login_name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="event_name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="time_stamp" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block font-size="22pt">
						<fo:leader />
					</fo:block>
					<fo:block font-size="22pt">
						<fo:leader />
					</fo:block>
					<!-- This defines the second section of the report-->
					<xsl:text xml:space="preserve" />
					<fo:block font-size="22pt" font-weight="bold">
						<xsl:value-of select="$ReportTableName2" />
						:
					</fo:block>
					<fo:table text-align="left" space-before="1mm"
						border-collapse="collapse" width="50%">
						<fo:table-column column-width="proportional-column-width(4)" />
						<fo:table-column column-width="proportional-column-width(4)" />
						<fo:table-column column-width="proportional-column-width(4)" />
						<fo:table-header>
							<fo:table-row width="100%">
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$UserName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$UserLoginName" />
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border-width="0.2mm" border-style="solid"
									text-align="center" background-color="#bbb">
									<fo:block wrap-option="wrap" padding="2mm" font-size="15pt"
										font-weight="bold">
										<xsl:value-of select="$TBRSentDate" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block></fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="root/dql3/row">
								<fo:table-row>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="user_login_name" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-width="0.2mm" border-style="solid"
										text-align="left">
										<fo:block wrap-option="wrap" padding="2mm"
											text-indent="2mm" font-size="15pt" font-weight="bold">
											<xsl:value-of select="date_sent" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>