[![Go Report Card](http://goreportcard.com/badge/rsdoiel/minie)](http://goreportcard.com/report/rsdoiel/minie)
[![License](https://img.shields.io/badge/License-BSD%203--Clause-blue.svg)](https://opensource.org/licenses/BSD-3-Clause)


# minie

Minimal Editor, a library for embedable terminal based text editing

This project was inspired by Zachary Yedidia's [micro](https://github.com/zyedidia/micro) text editor project.
The reason for a separate project is one of scope and purpose. _minie_ is a proof of concept minimal editor library
for creating embedded text editors for terminal based applications such as REPLs written in Go. Where
_micro_ is focusing on producing one editor, minie is focused on enabling a wide variety of editors to be
built from a common base.

## Proof of concept

The proof of concept implementation based directly my fork of [micro](https://github.com/rsdoiel/micro) with the following modifications

1. cmd/micro/\*.go has been moved to the root project folder with the package rename from main to minie
2. references to .config/micro are changes to refer to the built application's name (e.g. replaced with path.Base(os.Args[0]))
3. "func main" in micro.go is renamed "func Micro"
4. cmds/micro/micro.go is create as a "main" package with the "func main" invoking minie.Micro()
5. go run cmds/micro/micro.go yeilds a version of micro implemented as an embedded package named minie

This process has been automated in _scripts/mk-proof-of-concept.sh_.

## Someday Maybe list

* make sure mouse/key bindings are touch friendly using a SSH client on a tablet
* Update scripts to work directly from upstream rather than my fork
* Come up with a simple way to extend codebase with Go native code (sub-packages and a registeration function?)
* Remove the requirement to generate runtime.go
* Organize the codebase around simple abstractions
    * Registeration of extensions (Go native and JavaScript)
    * Buffer operations (e.g. anything that can be bound to a key or mouse actions)
    * Binding actions
    * Input (key/mouse events)
    * View
    * Screen
    * Support non-plain text file types
* Create a minie editor instance with my preferred keybinds and functions by default

