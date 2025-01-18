package main

import "net/http"

func (app *application) healthCheckhandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("OKAY"))
}
