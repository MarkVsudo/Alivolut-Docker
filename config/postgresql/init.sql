CREATE SCHEMA user_service;
CREATE USER user_service_user WITH PASSWORD 'user_service';
GRANT ALL PRIVILEGES ON SCHEMA user_service TO user_service_user;
GRANT USAGE ON SCHEMA user_service TO user_service_user;
GRANT CONNECT ON DATABASE postgres TO user_service_user;

CREATE SCHEMA currency_service;
CREATE USER currency_service_user WITH PASSWORD 'currency_service';
GRANT ALL PRIVILEGES ON SCHEMA currency_service TO currency_service_user;
GRANT USAGE ON SCHEMA currency_service TO currency_service_user;
GRANT CONNECT ON DATABASE postgres TO currency_service_user;

CREATE SCHEMA transactions_service;
CREATE USER transactions_service_user WITH PASSWORD 'transactions_service';
GRANT ALL PRIVILEGES ON SCHEMA transactions_service TO transactions_service_user;
GRANT USAGE ON SCHEMA transactions_service TO transactions_service_user;
GRANT CONNECT ON DATABASE postgres TO transactions_service_user;

CREATE SCHEMA keycloak;
CREATE USER keycloak_user WITH PASSWORD 'keycloak';
GRANT ALL PRIVILEGES ON SCHEMA keycloak TO keycloak_user;
GRANT USAGE ON SCHEMA keycloak TO keycloak_user;
GRANT CONNECT ON DATABASE postgres TO keycloak_user;
