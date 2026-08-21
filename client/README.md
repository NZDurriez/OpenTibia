# OTClient for this server

Ready-to-run [OTClient Redemption](https://github.com/opentibiabr/otclient) **4.1** (Windows 64-bit, OpenGL), already pointed at this repo's TFS 1.6 server.

You do not need to compile anything.

## Run

1. Start the game server first (`start-windows.bat` in the repo root) and wait until it says the world is open.
2. Double-click `start-client.bat` (or `otclient.exe`).
3. Log in with account `1` / password `1`.

The login screen is pre-filled:

| Field | Value |
| --- | --- |
| Server | `http://127.0.0.1/login.php` |
| Port | `8080` |
| Client version | `1310` |
| Enable HTTP login | yes |

## First launch (graphics)

Protocol 13.10 needs Tibia 13.10 appearance files. They are **not** in git.

On the first start, the client can download them into `data/things/1310/` (OTClient's `client_assets` installer). That needs internet access and can take a few minutes.

If you already have a Tibia 13.10 client you are allowed to use, copy its `assets` folder contents into `client/data/things/1310/` instead.

## Source

Engine source and this binary come from OTClient 4.1 (`dd564149`). See `BUILDINFO.txt` and `LICENSE` (MIT).
