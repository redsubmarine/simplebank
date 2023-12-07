db:
	docker-compose up

postgres:
	docker run --name npostgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it npostgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it npostgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go clean -testcache; go test -v -cover ./...

server:
	go run main.go

mock: # generate mock for db
	mockgen -package mockdb -destination db/mock/store.go github.com/redsubmarine/simplebank/db/sqlc Store

.PHONY: postgres db createdb dropdb migrateup migratedown sqlc test server mock