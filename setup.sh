brew install golang-migrate
echo 'migrate version'
migrate -version

brew install kyleconroy/sqlc/sqlc
echo 'sqlc version'
sqlc version

go get github.com/lib/pq

go get github.com/stretchr/testify

# gomock
go install go.uber.org/mock/mockgen@latest
asdf reshim
go get go.uber.org/mock/mockgen/model
