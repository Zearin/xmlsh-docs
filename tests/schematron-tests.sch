<?xml version="1.0" encoding="UTF-8"?>
<schema 
    xmlns=          "http://purl.oclc.org/dsdl/schematron"
    xmlns:iso=      "http://purl.oclc.org/dsdl/schematron"
    
    queryBinding=   "xslt2" 
    schemaVersion=  "ISO"
>
    
    <title>XMLSH DocBook Manpages</title>
    
    <ns prefix="db" uri="http://docbook.org/ns/docbook" />
    <ns prefix="xl" uri="http://www.w3.org/1999/xlink" />
    
    <let name="command-or-function-name" 
         value="@label"
     />
    
    <!--    
        NOTE TO SELF:
            Remember, the first matching rule in any <pattern>
            is the only one that will be evaluated.  
            
            (...Weird.  But I’m sure there was a reason for this design.)
    -->
    <pattern>
        <title>Root Level Structure</title>
        
        <rule context="db:refentry">
            <assert test="@version eq '5.0'">
                Should be DocBook 5.0
            </assert>
            
            <assert test="@label and string(@label)">
                A <name /> should have a "label" attribute with a value. 
            </assert>
            
            <assert test="@role and string(@role)">
                A <name /> should have a "role" attribute with a value.
            </assert>
            
            <assert test="db:refmeta">
                Should contain a 'refmeta' element.
            </assert>
            
            <assert test="db:refnamediv">
                Should contain a 'refnamediv' element.
            </assert>
            
            <assert test="db:refsynopsisdiv">
                Should contain a 'refsynopsisdiv' element.
            </assert>
            
            <assert test="db:refsection/db:title = 'Return Value'">
                Should contain a 'refsection' with the 'title' “Return Value”.
            </assert>
            
            <assert test="db:refsection/db:title = 'See Also'">
                Should contain a 'refsection' with the 'title' “See Also”.
            </assert>
        </rule>
    </pattern>
    
    
    <!-- refmeta
        ================================================================== -->
    <pattern>
        <title>Refmeta</title>
        
        <rule context="db:refmeta">
            <assert test="exists(db:refentrytitle/db:command)">
                A refentry’s title should contain a command element.
            </assert>
            
            <assert test="exists(db:manvolnum) and 
                          not(empty(db:manvolnum))">
                A <name /> should contain a (non-empty) "manvolnum" element.
            </assert>
        </rule>
    </pattern>
    
    
    <!-- refnamediv
        ================================================================== -->
    <pattern>
        <title>RefnameDiv</title>
        
        <rule context="db:refnamediv">
            <assert test="db:refname and not(empty(db:refname))">
                The <name /> element should contain a (non-empty) 'refname' element.
            </assert>
            
            <assert test="db:refpurpose and not(empty(db:refpurpose))">
                The <name /> element should contain a (non-empty) 'refpurpose' element.
            </assert>
        </rule>
    </pattern>
    
    
    <!-- refsynopsisdiv
        ================================================================== -->
    <pattern>
        <title>refsynopsisdiv</title>
        
        <rule context="db:refsynopsisdiv">
            <assert test="child::element()[1] = db:cmdsynopsis">
                The <name />’s first child element should be a cmdsynopsis.
            </assert>
        </rule>
    </pattern>
    
    
    <!-- refsections
        ================================================================== -->
    <pattern>
        <title>refsections</title>
        
        <p>Rules for the structure of refsection elements.  
           Each rule corresponds to a different section title.</p>
        
        <rule context="db:refsection[ db:title = 'Return Value' ]">
            <assert test="descendant::db:returnvalue or descendant::text() = 'None'">
                Should have either the text 'None' or a 'returnvalue' element.
            </assert>
        </rule>
        
        <rule context="db:refsection[ db:title = 'See Also' ]">
            <assert test="exists(db:para/db:uri)">
                Should contain a 'para' element that contains a 'uri' element.  
            </assert>
        </rule>
    </pattern>
    
</schema>