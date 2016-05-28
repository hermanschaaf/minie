#!/bin/bash

if [ -d $HOME/src/github.com/zyedidia/micro ]; then
    echo "Copying code into minie from github.com/rsdoiel/micro"
    cp -v $HOME/src/github.com/zyedidia/micro/cmd/micro/*.go ./
else
    echo "Fetching micro from Github"
    go get github.com/zyedidia/micro
fi

echo "Renaming package main to package minie"
ls -1 ./*.go | while read ITEM; do
   if [ "$ITEM" = "./micro.go" ]; then
      echo "Creating a modified $ITEM"
      sed -i.bak -e 's/package main/package minie/' \
          -e 's/Version = "Unknown"/\/\/ Version = "Unknown"/' \
          -e 's/configDir = xdgHome + "\/micro"/configDir = path.Join(xdgHome, path.Base(os.Args[0]))/' \
          -e 's/func main/func Micro/' \
          $ITEM
      echo "Fixing imports in $ITEM"
      goimports -w $ITEM
   else
      echo "Re-packaging $ITEM"
      sed -i.bak -e 's/package main/package minie/' $ITEM
   fi
done

echo "Recreating micro as an embedded minie"
mkdir -p cmds/micro
cat <<CODE > cmds/micro/micro.go
package main

import "github.com/rsdoiel/minie"

func main() {
    minie.Micro()
}
CODE

echo "Removing up .bak file"
/bin/rm *.bak

cat <<EOF

 Building an experimental micro

    go build cmds/micro/micro.go

 Building an experimental minie

    go build cmds/minie/minie.go

EOF


