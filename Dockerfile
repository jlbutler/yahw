FROM public.ecr.aws/docker/library/golang:1.18-alpine AS builder

ARG GOOS
ARG GOARCH

WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=${GOOS} GOARCH=${GOARCH} go build -o yahw

FROM scratch
COPY --from=builder /app/yahw /yahw
EXPOSE 8080
ENTRYPOINT ["/yahw"]