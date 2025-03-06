.PHONY: all clean build-linux-amd64 build-darwin-arm64 build-darwin-amd64

all: build-linux-amd64 build-darwin-arm64 build-darwin-amd64

build-linux-amd64:
	finch build --build-arg GOOS=linux --build-arg GOARCH=amd64 -t hello:linux-amd64 .

build-darwin-arm64:
	finch build --build-arg GOOS=darwin --build-arg GOARCH=arm64 -t hello:darwin-arm64 .

build-darwin-amd64:
	finch build --build-arg GOOS=darwin --build-arg GOARCH=amd64 -t hello:darwin-amd64 .

clean:
	finch rmi hello:linux-amd64 hello:darwin-arm64 hello:darwin-amd64 2>/dev/null || true