#!/bin/bash

echo "Copying code into minie from github.com/rsdoiel/micro"
cp -v $HOME/src/github.com/rsdoiel/micro/cmd/micro/*.go ./

echo "Renaming package main to package minie"
ls -1 ./*.go | while read ITEM; do
   sed -e "/package main/package minie/" $ITEM
done

echo "Adjusting configuration path in micro.go"

echo "Creating wrapper of micro clone"
mkdir -p cmds/micro
echo <<CODE
package main

import "github.com/rsdoiel/minie"

func main() {
    minie.CliEditor()
}
CODE


