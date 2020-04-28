# yahw
Yet another hello world.

A simple containerized hello world service.

```
$ docker build --build-arg GOOS=linux --build-arg GOARCH=amd64 -t hello:amd64 .
$ docker run -d -p 8080:8080 hello:amd64
$ curl localhost:8080/hello
{"arch":"x86_64","message":"Hello, there!","os":"Linux 4.14.173-137.229.amzn2.x86_64"}
```
