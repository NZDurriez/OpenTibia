# OTClient for this server

Ready-to-run [OTClient Redemption](https://github.com/opentibiabr/otclient) **4.1** (Windows 64-bit, OpenGL), already pointed at this repo's TFS 1.6 server.

You do not need to compile anything.

## Run

1. Start the game server first (`start-windows.bat` in the repo root) and wait until it says the world is open.
2. Double-click `start-client.bat` (or `otclient.exe`).
3. The first box is labeled **Email**. Type `1` (not an email address) and password `1`.

The login screen is pre-filled:

| Field | Value |
| --- | --- |
| Server | `http://127.0.0.1/login.php` |
| Port | `8080` |
| Client version | `1310` |
| Enable HTTP login | yes |

## First launch (graphics)

Protocol 13.10 needs Tibia 13.10 appearance files. They are **not** in git.

When the client starts, it should ask: **Assets for client 13.10 are not installed. Download them now?** Click **Download** and wait. That pulls tag `13.10.12892` from the OTClient asset repository into `data/things/1310/`.

If that prompt does not appear, or the download fails, double-click `fetch-13.10-assets.bat` in this folder.

If you already have a Tibia 13.10 client you are allowed to use, copy its `assets` folder contents into `client/data/things/1310/` instead.

## Source

Engine source and this binary come from OTClient 4.1 (`dd564149`). See `BUILDINFO.txt` and `LICENSE` (MIT).
