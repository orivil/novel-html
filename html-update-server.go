// Copyright 2019 orivil.com. All rights reserved.
// Use of this source code is governed by a MIT-style
// license that can be found at https://mit-license.org.

package main

import (
	"log"
	"net/http"
	"os"
	"os/exec"
)

func main() {
	addr := os.Getenv("http_port")
	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		output, err := exec.Command("/bin/bash", request.RequestURI).CombinedOutput()
		if err != nil {
			output = []byte(err.Error())
		}
		_, _ = writer.Write(output)
	})
	log.Printf("server listen on: %s\n", addr)
	log.Fatal(http.ListenAndServe(addr, nil))
}
