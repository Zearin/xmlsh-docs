<?xml version='1.0' encoding='UTF-8'?>
<p:pipeline
    name        =   "populate-command-names"

    version     =   "1.0"
    xpath-version=  "2.0"

    xmlns:p     =   "http://www.w3.org/ns/xproc"
    xmlns:c     =   "http://www.w3.org/ns/xproc-step"
    xmlns:err   =   "http://www.w3.org/ns/xproc-error"
    xmlns:xs    =   "http://www.w3.org/2001/XMLSchema"

    xmlns:pos   =   "http://exproc.org/proposed/steps/os"
    xmlns:pxf   =   "http://exproc.org/proposed/steps/file"
    xmlns:pxfn  =   "http://exproc.org/proposed/functions"
    xmlns:pxp   =   "http://exproc.org/proposed/steps"

    xmlns:cx    =   "http://xmlcalabash.com/ns/extensions"
    xmlns:cxf   =   "http://xmlcalabash.com/ns/extensions/fileutils"
    xmlns:cxo   =   "http://xmlcalabash.com/ns/extensions/osutils"
    xmlns:cxu   =   "http://xmlcalabash.com/ns/extensions/xmlunit"

    xmlns:h     =   "http://www.w3.org/1999/xhtml/"
    xmlns:db    =   "http://docbook.org/ns/docbook"
    xmlns:xsl   =   "http://www.w3.org/1999/XSL/Transform"

    xmlns:local =   "#empty"
>



    <p:documentation>
        <h:p>
            This script uses a refentry’s @label to populate a command name
            into the various DocBook markup structures.
        </h:p>
    </p:documentation>




    <!--
        MAIN PIPELINE CONTENT
    ======================================================================== -->
    <p:string-replace match="//db:command/text()|//db:refnamediv/db:refname/text()" replace="/db:refentry/@label" />






</p:pipeline>