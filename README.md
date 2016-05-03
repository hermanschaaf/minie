# minie

Minimal Editor, a library for embedable terminal based text editing

This project was inspired by Zachary Yedidia's [micro](https://github.com/zyedidia/micro) text editor project.
The reason for forking is that I wanted to play with Go native extensions and also be able to easily embed the
editor in other terminal based tools I've written (e.g. REPLS).

The proof of concept implementation based directly on micro with the following modifications

1. cmd/micro/*.go has been moved to the root project folder with the package rename from main to minie
2. references to .config/micro are changes to refer to the built application's name (e.g. replaced with path.Base(os.Args[0]))
3. "func main" in micro.go is renamed "func CliEditor"
4. cmds/micro/micro.go is create as a "main" package with the "func main" invoking minie.CliEditor()
5. go run cmds/micro/micro.go yeilds a version of micro with the new file organization




