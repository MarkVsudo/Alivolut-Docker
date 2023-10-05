# Start from the official PostgreSQL image
FROM docker.io/bitnami/postgresql:11

ENV SERVICE_NAME=postgresql

# Set the working directory in the container
WORKDIR /docker-entrypoint-initdb.d

# Copy your database backup into the container
COPY ./config/${SERVICE_NAME}/init.sql .
COPY ./config/${SERVICE_NAME}/keycloak_backup.sql .