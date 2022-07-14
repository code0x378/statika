default: build install

build:
	@echo "Building binary..."
	go build -ldflags="-s -w" -o bin/statika statika.go

# Compress even more with UPX (https://github.com/upx/upx)
# go build -ldflags="-s -w" -o bin/statika statika.go; upx bin/statika

build-all:
	@echo "Building binaries for all platforms..."
	GOOS=windows GOARCH=amd64 go build -ldflags="-s -w" -o bin/statika-win statika.go
	GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o bin/statika-osx statika.go
	GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o bin/statika-lin statika.go

install:
	@echo "Installing binary..."
	cp bin/statika ~/bin