package main

import (
	"log"

	"github.com/KengoWada/social/internal/db"
	"github.com/KengoWada/social/internal/env"
	"github.com/KengoWada/social/internal/store"
)

func main() {
	addr := env.GetString("DB_ADDR", "postgres://postgres:postgres@localhost/social?sslmode=disable")
	conn, err := db.New(addr, 30, 30, "15m")
	if err != nil {
		log.Fatal(err)
	}
	defer conn.Close()

	store := store.NewStorage(conn)
	db.Seed(store, conn)
}
