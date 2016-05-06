#!/bin/bash
for ITEM in bindings.go buffer.go colorscheme.go command.go cursor.go eventhandler.go gotolineno.go help.go highlighter.go messenger.go micro.go runtime.go search.go settings.go stack.go stack_test.go statusline.go toggleselection.go util.go util_test.go view.go micro cmds/micro/micro.go ; do 
    /bin/rm "$ITEM"
done
