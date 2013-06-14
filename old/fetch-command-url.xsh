#!/usr/bin/env xmlsh


#
#   Scrapes a URI from DocBook refentry   
#
import commands experimental

declare namespace d=http://docbook.org/ns/docbook
declare namespace x=http://www.w3.org/1999/xhtml
declare namespace g=http://un.known
declare namespace=http://www.w3.org/1999/xhtml

set +supports-dtd
set -indent
set -xml-encoding UTF-8
#set -xpipe
set -method xml



#
#   Scrape URI from DocBook refentry
#
commandURL=$( xcat $1 | xpath "//d:uri/text()" )

#echo "    commandURL = ${commandURL}"


#   
#   Fetch HTML for URI
#
try {
	
    ( http $commandURL | tail --lines=+2 | xquote | grep --invert-match -i 'g:plusone' | xunquote | xunquote )>{commandHTML}
	
} catch WstxParsingException {

    print $WstxParsingException 2> stderr-log.txt

} finally {
    
    # xdelete -m "x:form" | xdelete -m "x:div[ @style='clear: both' ]" | xdelete -m "x:br[ @clear='none' ]"
    
    #   Filter for div#content
    ( xecho <[ $commandHTML//x:div[ @id='content' ] ]> )>{filteredHTML}
    
    #   Clean up noise
    ( xcat $filteredHTML | xdelete -m 'x:form | x:hr | x:div[ @style ]' )>{refilteredHTML}
        
    xecho $refilteredHTML 
}