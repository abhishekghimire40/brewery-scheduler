# include .env
# export 
# DB_URL = postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@localhost:$(HOST_PORT)/$(POSTGRES_SCHEMA)?sslmode=disable
# OR
DB_URL := $(shell bash -c 'set -a && source .env 2>/dev/null && echo $$DATABASE_URL')

.PHONY: migrate-up migrate-down dev

migrate-up:
	goose -dir sql/schema postgres "$(DB_URL)" up

migrate-down:
	goose -dir sql/schema postgres "$(DB_URL)" down

dev: migrate-up
	go build -o brewery-scheduler main.go && ./brewery-scheduler
