//
// minie is a simple terminal based editor. It is an example of one
// editor implementation from the minie package.
//
// Copyright (c) 2016, R. S. Doiel
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
//
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// * Neither the name of minie nor the names of its
//   contributors may be used to endorse or promote products derived from
//   this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
package main

import (
	"flag"
	"fmt"
	"os"
	"path"

	// Minie package
	"github.com/rsdoiel/minie"
)

var (
	showHelp    bool
	showVersion bool
)

func init() {
	flag.BoolVar(&showHelp, "h", false, "display help information")
	flag.BoolVar(&showVersion, "v", false, "display version information")
}

func main() {
	flag.Parse()
	appname := path.Base(os.Args[0])
	if showHelp == true {
		fmt.Printf(`
 USAGE: %s [OPTIONS] FILENAME

 This is a simple editor demonstrating the minie package.

`, appname)

		flag.VisitAll(func(f *flag.Flag) {
			fmt.Printf("    -%s  (defaults to %s) %s\n", f.Name, f.Value, f.Usage)
		})
		fmt.Printf("\nVersion %s\n", minie.Version)
		os.Exit(0)
	}

	if showVersion == true {
		fmt.Printf("Version %s\n", minie.Version)
		os.Exit(0)
	}

	minie.Micro()
}
