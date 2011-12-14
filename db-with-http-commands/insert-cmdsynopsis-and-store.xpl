<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step 
	xmlns:p="http://www.w3.org/ns/xproc"
	xmlns:c="http://www.w3.org/ns/xproc-step"
	xmlns:db="http://docbook.org/ns/docbook"
	xmlns="http://docbook.org/ns/docbook"
	xmlns:cx="http://xmlcalabash.com/ns/extensions"
	exclude-inline-prefixes="db c"
	version="1.0">
	
	<p:input port="source">
		<p:document href="reflattened.xml" />
	</p:input>
	
	<p:output port="result" sequence="true"/>
	
	<p:import href="http://xmlcalabash.com/extension/steps/library-1.0.xpl" />
	
	<p:filter select="//db:refentry" />
	
	
	<p:for-each name="store">
		<p:variable name="cmd" select="db:refentry/@label" />
		
		<cx:message>
			<p:with-option name="message" select="db:refentry/@label" />
		</cx:message>
		
		<p:store omit-xml-declaration="false" encoding="UTF-8">
			<p:input port="source" />
			<p:with-option name="href" select="if (db:refentry/@label ne ':') then db:refentry/@label else 'colon'  , '.xml2'" />
		</p:store>
	</p:for-each>
	
	<p:identity>
		<p:input port="source">
			<p:empty></p:empty>
		</p:input>
	</p:identity>
</p:declare-step>