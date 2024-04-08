# MariaDB for Docker

## Install

To start using this container, start by cloning the repository:

```bash
git clone https://github.com/hawara-es/mariadb-for-docker.git
cd mariadb-for-docker
```

## Configure

Once you have cloned the repository, create a new `.env` file
and set your safe passwords there.

```bash
cp `env.example .env`
```

## Start the Container

To start the container with minimum settings, just run:

```bash
docker compose up -d
```

To start the container with the 3306 port binded to the host, use the
`docker-compose.port.yml` file:

```bash
docker compose -f docker-compose.yml -f docker-compose.port.yml up -d
```

## Test the Container Health

The container makes use of MariaDB's standard `healthcheck.sh`, so by
running a `ps` you should see a report about the health of your container:

```bash
docker compose ps
```

## Backup the Databases

To run backups for all the databases, you can use the bundled `dump.sh` script:

```bash
docker compose -f docker-compose.yml exec mariadb dump.sh
```
