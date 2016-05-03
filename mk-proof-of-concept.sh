#!/bin/bash

echo "Copying code into minie from github.com/rsdoiel/micro"
cp -v $HOME/src/github.com/rsdoiel/micro/cmd/micro/*.go ./

echo "Renaming package main to package minie"
ls -1 ./*.go | while read ITEM; do
    mv $ITEM $ITEM.bak
   sed -e 's/package main/package minie/g' $ITEM.bak > $ITEM
done

echo "Adjusting configuration path in micro.go"
if [ -f "micro.go" ]; then
    /bin/mv micro.go micro.go.bak
    sed -e 's/configDir = xdgHome + "\/micro"/configDir = path.Join(hdgHome, path.Base(os.Args[0]))/g' micro.go.bak > micro.go
    goimport -w micro.go
fi


echo "Creating wrapper of micro clone"
mkdir -p cmds/micro
cat <<CODE > cmds/micro/micro.go
package main

import "github.com/rsdoiel/minie"

func main() {
    minie.CliEditor()
}
CODE

echo "Removing up .bak file"
/bin/rm *.bak

