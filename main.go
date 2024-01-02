package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	unusedVariable := "I won't be used"
	fmt.Fprint(w, "Hello, world! v5")
}

func main() {
	http.HandleFunc("/", helloHandler)
	fmt.Println("Starting server on port 8080")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		fmt.Println(err)
	}
}
