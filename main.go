package main

import (
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	html := `<html><head><title>Test1</title></head><body><h1>Welcome to Test1</h1></body></html>`
	w.Write([]byte(html))
}

func main() {
	http.HandleFunc("/", handler)

	http.ListenAndServe(":8088", nil)
}
