# HTTP Server Component

A simple HTTP server that provides system information via a JSON API endpoint.

## Requirements

1. **Server Configuration Requirements**
   - **When** the server starts, **the system shall** use the PORT environment variable if set, otherwise default to port 8080.
   - **The system shall** log server startup information including the port number.

2. **HTTP Endpoint Requirements**
   - **When** a GET request is made to /hello, **the system shall** return system information in JSON format.
   - **If** a non-GET request is made to /hello, **the system shall** return a 405 Method Not Allowed error.
   - **If** system information cannot be retrieved, **the system shall** return a 500 Internal Server Error.

3. **Response Format Requirements**
   - **When** responding to requests, **the system shall** set the Content-Type header to application/json.
   - **If** JSON encoding fails, **the system shall** log the error.

## Implementation

### System Diagram
```mermaid
graph TD
    A[HTTP Server] --> B[/hello Handler]
    B --> C[System Info Service]
    C --> D[OS Information]
```

### Components
- HTTP Server: Listens on configured port
- Hello Handler: Processes GET requests to /hello endpoint
- System Info Service: Retrieves system information

## Use Cases

- As a monitoring system, I want to get system information via HTTP, so that I can track system metrics.
- As a developer, I want to receive system information in JSON format, so that I can easily parse and process the data.

### Glossary
- PORT: Environment variable defining the server port
- System Information: Includes OS type, architecture, and a greeting message