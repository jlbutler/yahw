.PHONY: all clean build-linux-amd64 build-linux-arm64

all: build-linux-amd64 build-linux-arm64

build-linux-amd64:
	finch build --build-arg GOOS=linux --build-arg GOARCH=amd64 -t hello:linux-amd64 .

build-linux-arm64:
	finch build --build-arg GOOS=linux --build-arg GOARCH=arm64 -t hello:linux-arm64 .

clean:
	finch rmi hello:linux-amd64 hello:linux-arm64 2>/dev/null || true