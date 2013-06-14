<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:db="http://docbook.org/ns/docbook"
	xmlns="http://docbook.org/ns/docbook"
	
	exclude-result-prefixes="xs xd db #default"
	
	xpath-default-namespace="#default"
	
	version="2.0">
	
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Jun 26, 2011</xd:p>
			<xd:p><xd:b>Author:</xd:b> amrogers</xd:p>
			<xd:p></xd:p>
		</xd:desc>
	</xd:doc>
	
	
	<xsl:param name="output-remap-attrs" as="xs:boolean"  select="false()" />
	<xsl:preserve-space elements="xsl:comment xsl:text"/>
	
	<xsl:output 
		exclude-result-prefixes="#default"
		
		encoding="UTF-8" 
		indent="yes" 
		omit-xml-declaration="no" 
		media-type="text/xml"
		version="1.0"
	/>
	
	

	
	
	<xsl:template match="*:commands" xml:space="default">
		<reference	xmlns	= "http://docbook.org/ns/docbook" 
		        	xmlns:xi= "http://www.w3.org/2001/XInclude"
		        	xmlns:xl= "http://www.w3.org/1999/xlink" 
		        	version	= "5.0">
			<xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'commands'" /></xsl:if>
			
			<xsl:for-each select="*:command" exclude-result-prefixes="#default">
				<xsl:sort select="@name" />
				<xsl:apply-templates select="."  />
			</xsl:for-each>
			
		</reference>
	</xsl:template>
	
	
	<xsl:template match="*:command">
		<refentry	xmlns	= "http://docbook.org/ns/docbook" 
		        	xmlns:xi= "http://www.w3.org/2001/XInclude"
		        	xmlns:xl= "http://www.w3.org/1999/xlink" 
		        	version	= "5.0"
		        	
					label	="{@name}">
			
			<xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'command'" /></xsl:if>
			<xsl:text>
			</xsl:text>
			<xsl:call-template name="refmeta" />
			
			<xsl:text>
			</xsl:text>	
			<xsl:call-template name="refnamediv" />
			
			<xsl:text>
			</xsl:text>
			<xsl:if test="*:usage"><xsl:call-template name="refsynopsisinfo" /></xsl:if>
			
			<xsl:text>
			</xsl:text>
			<!--<xsl:comment>	
				Full documentation (from here on).
				
				Equivalent to a manpage.
				
				@see
					http://www.docbook.org/tdg5/en/html/refsection.html
			</xsl:comment>
			<xsl:text>
</xsl:text>
			<refsection>
				<title>Description</title>
				<para></para>
			</refsection>
			<xsl:text>

</xsl:text>
			<refsection>
				<title>Implementation</title>
				<para></para>
			</refsection>
			<xsl:text>

</xsl:text>
			<refsection>
				<title>Return Value</title>
				<para></para>
			</refsection>
			<xsl:text>

</xsl:text>-->
			 
			 
			<refsection>
				<title>See Also</title>
				<para><uri><xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'command/@url'" /></xsl:if><xsl:value-of select="@url"/></uri></para>
			</refsection>
			<xsl:text>
			</xsl:text>
		</refentry>
<xsl:text>




</xsl:text>
	</xsl:template>
	
	
	<xsl:template name="refmeta">
		<refmeta>
			<refentrytitle><command><xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'command/@name'" /></xsl:if><xsl:value-of select="@name"/></command></refentrytitle>
			
			<manvolnum></manvolnum>
			
			<!--<refmiscinfo>
				<xsl:text>
				</xsl:text>
				<xsl:comment>
					@see
						http://www.docbook.org/tdg5/en/html/refmiscinfo.html
					
					Meta-information for a reference entry other than the title and 
					volume number.
					
					The refmiscinfo element is an escape hatch for additional 
					meta-information about a reference page. It may hold copyright 
					information, release or revision information, descriptive text 
					for use in a print header or footer, or any other information 
					not explicitly provided for in refmeta.
				</xsl:comment>
				<xsl:text>
				</xsl:text>
			</refmiscinfo>-->
			<xsl:text>
			</xsl:text>
		</refmeta>
		<xsl:text>
		</xsl:text>
	</xsl:template>
	
	
	
	<xsl:template name="refnamediv">
		<refnamediv>
			<!--<refdescriptor>
				<xsl:text>
				</xsl:text>
				<xsl:comment>	
					A description of the topic of a reference page.
					
					Reference pages (refentrys) are usually identified by a short, 
					succinct topic name, such as the name of a function or command. 
					The refname (or one of the refnames, in the case of a reference 
					page that has several) is generally used as the topic name. 
					When none of the refnames is appropriate, refdescriptor is used 
					to specify the topic name.
		
					A refdescriptor is unnecessary when an appropriate refname can be 
					selected automatically. At least one refname is required, so 
					refdescriptor cannot be used in place of a name, only in addition 
					to it.
				</xsl:comment>
				<xsl:text>
				</xsl:text>
			</refdescriptor>-->
			
			<refname><xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'command/@name'" /></xsl:if><xsl:value-of select="@name"/></refname><xsl:text>
			
			</xsl:text><refpurpose><xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'command/synopsis'" /></xsl:if><xsl:value-of select="*:synopsis"/></refpurpose><xsl:text>
			
			</xsl:text>
			<refclass>
				<xsl:text>
				</xsl:text><xsl:comment>builtin</xsl:comment>
				<xsl:text>
				</xsl:text><xsl:comment>command</xsl:comment>
				<xsl:text>
				</xsl:text><xsl:comment>function</xsl:comment>
				<xsl:text>
				</xsl:text>
			</refclass>
		</refnamediv>
	</xsl:template>
	
	
	<xsl:template name="refsynopsisinfo">
		<refsynopsisdiv>
			<xsl:if test="$output-remap-attrs"><xsl:attribute name="remap" select="'command/usage'" /></xsl:if>
			<xsl:if test="*:usage">
				<xsl:comment xml:space="preserve">
					<xsl:copy-of 
						xml:space="preserve" 
						select="*:usage" 
					/>
				</xsl:comment>
				<cmdsynopsis>
					<command></command> 
					
					<arg></arg>
					<arg></arg>
					<arg></arg>
				</cmdsynopsis>
			</xsl:if>
		</refsynopsisdiv>
	</xsl:template>
	
</xsl:stylesheet>