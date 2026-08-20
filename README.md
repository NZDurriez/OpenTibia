# Open Tibia server

Ready-to-run [The Forgotten Server](https://github.com/otland/forgottenserver) **1.6** package. Binaries are included for **Windows 64-bit** and **Linux x86_64**. You do not need a compiler to start the server.

| Item | Value |
| --- | --- |
| Engine | The Forgotten Server 1.6 |
| Protocol | **13.10** (13.11 clients also accepted) |
| Map | `forgotten` (official TFS sample map) |
| Windows | `server/theforgottenserver-x64.exe` plus official OTLand DLLs |
| Linux | `server/tfs`, compiled on Ubuntu 24.04 with GCC 13.3 |

This repository redistributes TFS under the GNU GPL v2. Source for the engine is in `vendor/forgottenserver-1.6/`. See `NOTICE` and `server/BUILDINFO.txt`.

## What you need besides this repo

1. **MariaDB or MySQL** for player accounts. [Docker Desktop](https://www.docker.com/products/docker-desktop/) is enough.
2. A **protocol 13.10 client**. Use an open-source client such as [OTClient](https://github.com/mehah/otclient). Do not use CipSoft's official Tibia client files unless you have the right to do so.

## Windows + Docker Desktop

1. Start **Docker Desktop** and wait until it is running.
2. Clone or download this repository (use the branch from the pull request if it is not merged yet).
3. Double-click `start-windows.bat` in the repo root.

That starts MariaDB in Docker, waits until the schema is imported, then launches `server/theforgottenserver-x64.exe`. The first run downloads the `mariadb:11` image.

To start only the database:

```bat
docker compose up -d --wait db
```

Then double-click `server/start.bat`.

If port **3306** is already taken (XAMPP, local MySQL), stop that service or change the left-hand port in `docker-compose.yml`.

Default database settings in `server/config.lua`:

- host `127.0.0.1`, port `3306`
- user `forgottenserver`, password `tfs`
- database `forgottenserver`

Without Docker, install MariaDB, then as an admin user:

```bash
mysql -u root -p < server/create-database.sql
mysql -u forgottenserver -ptfs forgottenserver < server/schema.sql
mysql -u forgottenserver -ptfs forgottenserver < server/init-accounts.sql
```

## Linux

Install runtime libraries if the binary does not start:

```bash
sudo apt-get install -y libboost-iostreams1.83.0 libboost-locale1.83.0 libboost-json1.83.0 \
  libfmt9 libpugixml1v5 liblua5.3-0 libmysqlclient21 libssl3t64
```

Then:

```bash
chmod +x server/start.sh server/tfs
./server/start.sh
```

A successful boot prints that the game world is open and listens on:

- login / status: **7171**
- game world: **7172**
- HTTP login API (12+ / 13.x clients): **8080**

## Log in

Starter accounts from `server/init-accounts.sql`:

| Account | Password | Character | Notes |
| --- | --- | --- | --- |
| `1` | `1` | `Player` | Normal player, level 8 |
| `god` | `god` | `God` | God group, for testing commands |

In the client, connect to **127.0.0.1**. If the client asks for a login port, use **7171**. Newer 13.x clients often use the HTTP login port **8080**.

Change these passwords before exposing the server to a network.

## Useful files

- `server/config.lua` — IP, ports, rates, MySQL, world name
- `server/data/` — scripts, items, NPCs, monsters, map
- `server/schema.sql` — database structure
- `scripts/build-linux.sh` — rebuild the Linux binary from `vendor/forgottenserver-1.6`

To accept connections from other computers, set `ip` in `server/config.lua` to this machine's LAN or public address and open ports 7171, 7172, and 8080.

## License

The Forgotten Server is free software licensed under the GNU General Public License v2. See `LICENSE`.
