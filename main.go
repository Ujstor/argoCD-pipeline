package main

import (
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	html := `<html><head><title>Test1</title></head><body><h1>Welcome to Test1</h1></body></html>`
	_, err := w.Write([]byte(html))
	if err != nil {
		http.Error(w, "Error writing response", http.StatusInternalServerError)
		return
	}
}

func main() {
	http.HandleFunc("/", handler)

	err := http.ListenAndServe(":8088", nil)
	if err != nil {
		log.Fatalf("Error starting server: %s", err)
	}
}
