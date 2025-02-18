include .env
MIGRATIONS_PATH = ./cmd/migrate/migrations

migration:
	@migrate create -seq -ext sql -dir $(MIGRATIONS_PATH) $(filter-out $@,$(MAKECMDGOALS))

migrate-up:
	@migrate -path $(MIGRATIONS_PATH) -database $(DB_ADDR) up

migrate-down:
	@migrate -path $(MIGRATIONS_PATH) -database $(DB_ADDR) down

migrate-force:
	@migrate -path $(MIGRATIONS_PATH) -database $(DB_ADDR) force

seed:
	@go run cmd/migrate/seed/main.go

gen-docs:
	@swag init -g ./api/main.go -d cmd,internal && swag fmt

.PHONY: migration migrate-up migrate-down seed gen-docs migrate-force
