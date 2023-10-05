# AliVolut Local Setup

This repository contains everything needed to run the AliVolut project in a local environment.

## Prerequisites

Before starting, please ensure you have the following prerequisites installed and configured:

- Docker: Install Docker following the instructions provided [here](https://docs.docker.com/get-docker/). Docker is
  required to build and run the containers defined in the docker-compose.yml file.

- SSH Key Setup in Bitbucket: You need to set up an SSH key in Bitbucket to clone the repository and its submodules.
  Follow the instructions provided [here](https://confluence.atlassian.com/bitbucket/set-up-an-ssh-key-728138079.html)
  to set up your SSH key in Bitbucket.

## Repository Contents

The repository includes the following:

- Submodules for the backend and frontend applications
    - [Backend User application](/user-service)
    - [Backend Transactions application](/transactions-service)
    - [Backend Currency application](/currency-service)
    - [Frontend Platform application](/platform-ui)
    - [Frontend Currency application](/currency-ui)
- [docker-compose.yml](/docker-compose.yml) to run all the applications in a local environment
- [Folder for the database volumes](/data)
- [Folder for service configurations](/config)
- Dockerfiles for the backend, frontend applications and the preconfigured Postgres database, needed for Keycloak
    - [Backend User application](docker_user-service.dockerfile)
    - [Backend Transactions application](docker_transactions-service.dockerfile)
    - [Backend Currency application](docker_currency-service.dockerfile)
    - [Frontend Platform application](docker_platform-ui.dockerfile)
    - [Frontend Currency application](docker_currency-ui.dockerfile)
    - [Preconfigured Postgres Database](docker_postgresql.dockerfile)

## How to Use

### Run the AliVolut project locally with docker-compose

1. **Clone the repository** with all submodules:
    ```bash
    git clone --recurse-submodules git@ssh.dev.azure.com:v3/cleverpine/CP%20Internship%2007-2023/CP_Internship_07-2023
    ```

2. **Checkout the branch** you want to use for each project

3. **Run the docker-compose.yml file** to start all the services:
    ```bash
    docker-compose up -d
    ```

4. **Wait for the services to start**. You can check the status of the services using:
    ```bash
    docker-compose ps
    ```

7. **Troubleshooting**

- Check the logs of the services using:
  ```bash
  docker-compose logs -f <service name>
  ```

6. **Access the applications**:

    - Frontend Platform Application: [http://localhost:81](http://localhost:81)

    - Frontend Currency Application: [http://localhost:82](http://localhost:82)

    - Backend User Application: [http://localhost:8081](http://localhost:8081)
        - You would need an access token to access the API.
          You then have to add it to the `Authorization` header of your request with the `Bearer` prefix.

    - Backend Transactions Application: [http://localhost:8082](http://localhost:8082)
        - You would need an access token to access the API.
          You then have to add it to the `Authorization` header of your request with the `Bearer` prefix.

    - Backend Currency Application: [http://localhost:8083](http://localhost:8083)
        - You would need an access token to access the API.
          You then have to add it to the `Authorization` header of your request with the `Bearer` prefix.

    - Keycloak Instance: [http://localhost:8585](http://localhost:8585)
        - Admin Login credentials:
            - Username: `user`
            - Password: `bitnami`
        - To retrieve a token manually
            ```bash
              curl --location 'http://localhost:8585/realms/master/protocol/openid-connect/token' \
                   --header 'Content-Type: application/x-www-form-urlencoded' \
                   --data-urlencode 'username=username' \
                   --data-urlencode 'password=password' \
                   --data-urlencode 'grant_type=password' \
                   --data-urlencode 'client_id=platform'
            ```
7. **Making changes to the services**. If you make changes to the services you would have to rebuild the image. You can
   do that by executing:
   ```bash
    # Stop your Docker Compose stack if it's running
    docker-compose down
    
    # Rebuild the Docker image for the service
    docker-compose build <service name>
    
    # Start your Docker Compose stack
    docker-compose up -d
   ```
    - Backend User Application:
        - command: `docker-compose build alivolut_user-service`
    - Backend Transactions Application:
        - command: `docker-compose build alivolut_transactions-service`
    - Backend Currency Application:
        - command: `docker-compose build alivolut_currency-service`
    - Frontend Platform Application:
        - command: `docker-compose build alivolut_platform-ui`
    - Frontend Currency Application:
        - command: `docker-compose build alivolut_currency-ui`

That's it! You should now have the AliVolut project running locally on your machine.

7. **Configure the services**.
   The configuration files are located [here](config). If you make changes to the configurations you would have to
   rebuild the image, same as above.

### Credentials

#### Keycloak

- Admin User
    - Username: `user`
    - Password: `bitnami`
- Platform User
    - Username: `username`
    - Password: `password`
- Currency User
    - Username: `username`
    - Password: `password`

#### Database

- Admin User
  - Database: `postgres`
  - Username: `postgres`
  - Password: `postgres`
- User Service Database
  - Database: `postgres`
  - Schema: `user_service`
  - Username: `user_service_user`
  - Password: `user_service`
- Transactions Service Database
  - Database: `postgres`
  - Schema: `transactions_service`
  - Username: `transactions_service_user`
  - Password: `transactions_service`
- Currency Service Database
  - Database: `postgres`
  - Schema: `currency_service`
  - Username: `currency_service_user`
  - Password: `currency_service`

### Integration with IntelliJ

Follow the steps below to add the backend project to IntelliJ:

1. Open IntelliJ select `File > New > Project from Existing Sources...` and select the root folder of the repository.
2. Select `Create project from existing sources` and click `Next`.

![step_1.png](readme-static%2Fstep_1.png)

3. Chose a name for the project and click `Next`

![step_2.png](readme-static%2Fstep_2.png)

4. Click `Unmark All` and then click `Create`

![step_3.png](readme-static%2Fstep_3.png)

5. Select `File > New > Module from Existing Sources...`

![step_4.png](readme-static%2Fstep_4.png)

6. Select the [pom.xml in the t_ccl-service folder](t_ccl-service/pom.xml) and click `Open`

#### To run the project in IntelliJ

1. You have to create a local configuration file named `application-local.yml` in the service's resources folder.
   You can use [application-docker.yml](config/user-service/application-docker.yml) as a template, but keep in mind
   to change the dataabse and keycloak host to localhost and the port to the one defined in the docker-compose.yml file.
2. You need to configure the active profile to `local` in the `Run/Debug Configurations` window. 