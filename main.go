package main

import (
	"encoding/json"
	"net/http"
	"syscall"
)

func stringify(f [65]int8) string {
	out := make([]byte, 0, 64)
	for _, v := range f[:] {
		if v == 0 {
			break
		}
		out = append(out, uint8(v))
	}
	return string(out)
}

func getSystemInfo() map[string]string {
	var uname syscall.Utsname
	if err := syscall.Uname(&uname); err != nil {
		panic(err)
	}

	m := make(map[string]string)
	m["message"] = "Hello, there!"
	m["os"] = stringify(uname.Sysname) + " " + stringify(uname.Release)
	m["arch"] = stringify(uname.Machine)
	return m
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(getSystemInfo())
}

func main() {
	http.HandleFunc("/hello", helloHandler)
	http.ListenAndServe(":8080", nil)
}
