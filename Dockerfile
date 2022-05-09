# syntax=docker/dockerfile:1
FROM public.ecr.aws/docker/library/golang:1.18 AS builder
WORKDIR /build
COPY . .

ARG TARGET_OS
ARG TARGET_ARCH
RUN CGO_ENABLED=0 GOOS=${TARGET_OS} GOARCH=${TARGET_ARCH} go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o hello .

FROM scratch
EXPOSE 8080
COPY --from=builder /build/hello /app/
WORKDIR /app
ENTRYPOINT ["./hello"]
