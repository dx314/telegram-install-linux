# Telegram Installer for Linux

This script installs the latest version of Telegram Desktop on your Linux system. It automatically downloads, extracts, and sets up Telegram locally in your home directory, adding it to your applications menu and enabling you to run it from the terminal.

## How to Run

You can run the installer directly from the internet using either `curl` or `wget`. Follow the steps below:

### Using `curl`

Open a terminal and run the following command:

```bash
bash <(curl -s https://raw.githubusercontent.com/dx314/telegram-install-linux/main/install_telegram.sh)
```

### Using `wget`

Alternatively, you can use `wget` with this command:

```bash
bash <(wget -qO- https://raw.githubusercontent.com/dx314/telegram-install-linux/main/install_telegram.sh)
```

## What the Script Does

- Downloads the latest version of Telegram from the official website.
- Extracts it into the `~/Applications/Telegram` directory.
- Creates a symlink in `~/.local/bin/telegram` for easy access.
- Adds Telegram to your application menu by creating a `.desktop` file in `~/.local/share/applications`.
- Downloads a Telegram icon for use in the application menu.

## Modifying the Installation

If you'd like to customize the installation process, here are the main points where you can make adjustments:

### Change the Install Directory

By default, the script installs Telegram in `~/Applications/Telegram`. If you want to install it in a different directory, you can modify the `INSTALL_DIR` variable at the beginning of the script.

For example, to install Telegram in a custom directory, change:

```bash
INSTALL_DIR="$HOME/Applications/Telegram"
```

to:

```bash
INSTALL_DIR="/path/to/your/custom/directory"
```

### Change the Symlink Location

The script creates a symlink in `~/.local/bin/telegram`, which allows you to run Telegram from the terminal by typing `telegram`. If you want the symlink to be created in a different directory, modify the `LOCAL_BIN` variable:

```bash
LOCAL_BIN="$HOME/.local/bin/telegram"
```

to:

```bash
LOCAL_BIN="/your/custom/bin/telegram"
```

Make sure that the chosen directory is in your `$PATH` for easy terminal access.

### Change the Icon Location

The script downloads the Telegram icon and saves it in `~/.local/share/icons/telegram.png`. If you want to store the icon elsewhere, modify the `ICON_PATH` variable:

```bash
ICON_PATH="$HOME/.local/share/icons/telegram.png"
```

to:

```bash
ICON_PATH="/your/custom/icon/location/telegram.png"
```

### Add Telegram to a Different Applications Directory

By default, the script adds the `.desktop` file to `~/.local/share/applications` to make Telegram appear in your application menu. If you'd like to place it somewhere else, update the `DESKTOP_FILE` path:

```bash
DESKTOP_FILE="$HOME/.local/share/applications/telegram.desktop"
```

to:

```bash
DESKTOP_FILE="/your/custom/path/telegram.desktop"
```

## Usage

After installation, you can:

- Launch Telegram from your application menu.
- Start Telegram from the terminal by typing:

```bash
telegram
```
