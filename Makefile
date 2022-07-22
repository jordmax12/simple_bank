postgres:
	docker run --name golang -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:12-alpine

createdb:
	docker exec -it golang createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it golang dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

.PHONY: postgres createdb dropdb migrateup migratedown
