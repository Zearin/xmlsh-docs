<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step 
	version		="1.0"	
	xmlns:p		="http://www.w3.org/ns/xproc"
	xmlns:c		="http://www.w3.org/ns/xproc-step"
	
	xmlns:db	="http://docbook.org/ns/docbook"
	xmlns		="http://docbook.org/ns/docbook"
	xmlns:cx	="http://xmlcalabash.com/ns/extensions"
	
	exclude-inline-prefixes="db c cx p"
>
	
	
	<p:input	port="source" sequence="true">
		<p:document href="break.xml" />
		<!--<p:document href="cd.xml" />
		<p:document href="colon.xml" />
		<p:document href="continue.xml" />
		<p:document href="csv2xml.xml" />
		<p:document href="declare.xml" />
		<p:document href="echo.xml" />
		<p:document href="eval.xml" />
		<p:document href="exit.xml" />
		<p:document href="false.xml" />
		<p:document href="fixed2xml.xml" />
		<p:document href="help.xml" />
		<p:document href="http.xml" />
		<p:document href="httpserver.xml" />
		<p:document href="httpsession.xml" />
		<p:document href="import.xml" />
		<p:document href="jcall.xml" />
		<p:document href="jobs.xml" />
		<p:document href="log.xml" />
		<p:document href="read.xml" />
		<p:document href="require.xml" />
		<p:document href="return.xml" />
		<p:document href="rngconvert.xml" />
		<p:document href="rngvalidate.xml" />
		<p:document href="set.xml" />
		<p:document href="shift.xml" />
		<p:document href="source.xml" />
		<p:document href="test.xml" />
		<p:document href="throw.xml" />
		<p:document href="tie.xml" />
		<p:document href="true.xml" />
		<p:document href="unset.xml" />
		<p:document href="wait.xml" />
		<p:document href="xaddattribute.xml" />
		<p:document href="xaddbase.xml" />
		<p:document href="xbase.xml" />
		<p:document href="xcat.xml" />
		<p:document href="xcmp.xml" />
		<p:document href="xdelete.xml" />
		<p:document href="xecho.xml" />
		<p:document href="xed.xml" />
		<p:document href="xfile.xml" />
		<p:document href="xgetopts.xml" />
		<p:document href="xgrep.xml" />
		<p:document href="xidentity.xml" />
		<p:document href="xinclude.xml" />
		<p:document href="xls.xml" />
		<p:document href="xmd5sum.xml" />
		<p:document href="xml2csv.xml" />
		<p:document href="xmlsh.xml" />
		<p:document href="xmove.xml" />
		<p:document href="xpath.xml" />
		<p:document href="xproperties.xml" />
		<p:document href="xpwd.xml" />
		<p:document href="xquery.xml" />
		<p:document href="xread.xml" />
		<p:document href="xsdvalidate.xml" />
		<p:document href="xslt.xml" />
		<p:document href="xslt1.xml" />
		<p:document href="xsplit.xml" />
		<p:document href="xsql.xml" />
		<p:document href="xtee.xml" />
		<p:document href="xtype.xml" />
		<p:document href="xunzip.xml" />
		<p:document href="xuri.xml" />
		<p:document href="xvalidate.xml" />
		<p:document href="xversion.xml" />
		<p:document href="xwhich.xml" />
		<p:document href="xzip.xml" />-->
	</p:input>
	<p:output	port="result" sequence="true" />

	<p:import	href="http://xmlcalabash.com/extension/steps/library-1.0.xpl"	/>
	<p:import	href="http://xmlcalabash.com/extension/steps/fileutils.xpl"		/>
	<p:import	href="http://xmlcalabash.com/extension/steps/osutils.xpl"		/>

	<p:identity />

	<cx:message>
		<p:with-option name="message" select="p:base-uri()" />
	</cx:message>

	<p:identity />
		
	<!--<p:insert match="db:refsynopsisdiv" position="after">
		<p:input port="insertion">
			<p:document href="../http-scraped-commands/${docname}" />
		</p:input>
	</p:insert>-->
	
	
</p:declare-step>