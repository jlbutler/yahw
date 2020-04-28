.PHONY: amd64 arm64 clean all

amd64 :
	@(docker build --build-arg GOOS=linux --build-arg GOARCH=amd64 -t hello:amd64 . && \
		docker system prune -f)

arm64 :
	@(docker build --build-arg GOOS=linux --build-arg GOARCH=arm64 -t hello:arm64 . && \
		docker system prune -f)

clean :
	@(docker rmi -f hello:amd64 2> /dev/null) |:
	@(docker rmi -f hello:arm64 2> /dev/null) |:

all : amd64 arm64
