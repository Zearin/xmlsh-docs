#!/usr/bin/env xmlsh

# This script uses a refentry’s @label to populate a command name 
# into the various DocBook markup structures.

filename=$1
command_name=$(xpath -cf "${filename}" -s -q "/*:refentry/@label") 

#echo $command_name

xed -i "${filename}" -a "${command_name}" -matches "*:command/text()"
xed -i "${filename}" -a "${command_name}" -matches "*:refnamediv/*:refname/text()"
#xed -i "${filename}" -r "${command_name}" -xpath "//*:refsynopsisdiv/*:cmdsynopsis/*:command"

#//refmeta/refentrytitle/command
#//refnamediv/refname
#//refsynopsisdiv/cmdsynopsis/command