brew install golang-migrate
echo 'migrate version'
migrate -version

brew install kyleconroy/sqlc/sqlc
echo 'sqlc version'
sqlc version

go get github.com/lib/pq

go get github.com/stretchr/testify