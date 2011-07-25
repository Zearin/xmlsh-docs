<?xml version='1.0' encoding='UTF-8'?>
<?xml-stylesheet type="text/css" href="/Users/amrogers/Developer/Applications/oxygen/frameworks/xproc/css/xproc.css"?>
<p:declare-step
	name		=	"commands2docbook"
	version		=	"1.0"
	xpath-version=	"2.0"
	
    xmlns:p		=	"http://www.w3.org/ns/xproc"
	xmlns:c		=	"http://www.w3.org/ns/xproc-step"
	xmlns:err	=	"http://www.w3.org/ns/xproc-error"
	xmlns:xs	=	"http://www.w3.org/2001/XMLSchema"
	
	xmlns:pos	=	"http://exproc.org/proposed/steps/os"
	xmlns:pxf	=	"http://exproc.org/proposed/steps/file"
	xmlns:pxfn	=	"http://exproc.org/proposed/functions"
	xmlns:pxp	=	"http://exproc.org/proposed/steps"
	
	xmlns:cx	=	"http://xmlcalabash.com/ns/extensions"
	xmlns:cxf	=	"http://xmlcalabash.com/ns/extensions/fileutils"
	xmlns:cxo	=	"http://xmlcalabash.com/ns/extensions/osutils"
	xmlns:cxu	=	"http://xmlcalabash.com/ns/extensions/xmlunit"
	
    xmlns:h		=	"http://www.w3.org/1999/xhtml/"
    xmlns:xsl	=	"http://www.w3.org/1999/XSL/Transform"
	
	xmlns:local	=	"#empty">
	
	
	
	<p:documentation>
		<h:p>Convert the custom-XML 'commands.xml' into a series of DocBook files.</h:p>
	</p:documentation>
	
	
	
	<!--	
		I/O
	======================================================================== -->
	<p:input	port="source">
		<p:document href="commands.xml" />
	</p:input>
	
	<p:output	port="result" sequence="true">
		<p:empty />
	</p:output>
	
	
	
	<!--	
		SERIALIZATIONS 
		May bind to any output (not just "result").
	======================================================================== -->
	<!--<p:serialization
		port				="result" 
	 	encoding			="UTF-8" 
	 	omit-xml-declaration="false" 
	 	version				="1.0"
	/>-->
	
	
	<!--	
		VARIABLES
	======================================================================== -->
	
	
	
	<!--
		IMPORTS
	======================================================================== -->
	<p:import	href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"	/>
	<p:import	href="http://xmlcalabash.com/extension/steps/fileutils.xpl"		/>
	<p:import	href="http://xmlcalabash.com/extension/steps/osutils.xpl"		/>
	
	<!--<p:import	href="src/lib/mylib-xproc/ex-recursive-directory-list.xpl"		/>-->
    
	
	
	<!--	
		MAIN PIPELINE CONTENT
	======================================================================== -->
	<p:group>	
	
		<p:for-each>
			<p:iteration-source select="//*:command" />
			
			<p:xslt name="xslt">
				<p:input port="source" />
				<p:input port="stylesheet">
					<p:document href="commands2docbook.xsl" />
				</p:input>
				<p:input port="parameters" >
					<p:empty />
				</p:input>
			</p:xslt>
			
			<p:group>
				<p:variable
					name="label" 
					select="if		(*:refentry/@label eq ':') then 'colon'
							else if	(*:refentry/@label eq '[') then 'test'
							else 	*:refentry/@label" 
				/>
				
				<cx:message>
					<p:with-option name="message" select="$label" />
				</cx:message>
			
				<p:store indent="true" omit-xml-declaration="false" encoding="UTF-8">
					<p:with-option	name="href" 
									select="concat('OUTPUT/', $label , '.xml')" />
				</p:store>
			</p:group>
		</p:for-each>
	</p:group>
	
</p:declare-step>