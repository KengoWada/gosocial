include .env
MIGRATIONS_PATH = ./cmd/migrate/migrations

migration:
	@migrate create -seq -ext sql -dir $(MIGRATIONS_PATH) $(filter-out $@,$(MAKECMDGOALS))

migrate-up:
	@migrate -path $(MIGRATIONS_PATH) -database $(DB_ADDR) up

migrate-down:
	@migrate -path $(MIGRATIONS_PATH) -database $(DB_ADDR) down

seed:
	@go run cmd/migrate/seed/main.go

.PHONY: migration migrate-up migrate-down seed
