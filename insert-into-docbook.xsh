#!/usr/bin/env xmlsh

#
#
#

import commands experimental

declare namespace d=http://docbook.org/ns/docbook
declare namespace x=http://www.w3.org/1999/xhtml
#declare namespace g=http://un.known
declare namespace=http://www.w3.org/1999/xhtml

set +supports-dtd
set -indent
set -xml-encoding UTF-8



( ./fetch-command-url.xsh $1 )>{insertion}
xread targetDoc <$1


xecho $insertion
echo ''
xecho $targetDoc