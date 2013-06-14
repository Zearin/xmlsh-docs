#!/usr/bin/env xmlsh

import commands experimental

declare namespace d=http://docbook.org/ns/docbook
declare namespace x=http://www.w3.org/1999/xhtml
#declare namespace g=http://un.known
declare namespace=http://www.w3.org/1999/xhtml

set +supports-dtd
set -indent
set -xml-encoding UTF-8
#set -method xml


#( ./fetch-command-url.xsh $1 )>{insertion}
#xread targetDoc <$1

commandName=$1 

insertionurl='http-scraped-commands/'$1'.xml'
targetdocurl='db-with-http-commands/'$1'.xml'

( xcat $insertionurl )>{insertion}
( xcat $targetdocurl )>{targetdoc}



( xed -i $targetdoc -a $insertion -m "//d:refsynopsisdiv" ) | xcat



#echo 'INSERTION:'
#echo '=========='
#xecho $insertion
#echo ''
#echo ''
#echo 'TARGET DOC:'
#echo '==========='
#xecho $targetdoc
#
#
