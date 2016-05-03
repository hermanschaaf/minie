#!/bin/bash
LS=$(ls -1 *.go)
if [ "$LS" != "" ]; then
    /bin/rm *.go
fi
if [ -d cmds/micro ]; then
    /bin/rm -fR cmds
fi
