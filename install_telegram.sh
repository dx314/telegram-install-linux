#!/bin/bash

INSTALL_DIR="$HOME/Applications/Telegram"
LOCAL_BIN="$HOME/.local/bin/telegram"
DESKTOP_FILE="$HOME/.local/share/applications/telegram.desktop"
ICON_URL="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg"
ICON_PATH="$HOME/.local/share/icons/telegram.png"
TELEGRAM_URL="https://telegram.org/dl/desktop/linux"
TAR_FILE="$HOME/Downloads/telegram.tar.xz"

echo "Downloading the latest version of Telegram..."
curl -L -o "$TAR_FILE" "$TELEGRAM_URL"

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/Applications"

echo "Extracting $TAR_FILE..."
tar -xvf "$TAR_FILE" -C "$HOME/Downloads"

mv "$HOME/Downloads/Telegram" "$INSTALL_DIR"
ln -sf "$INSTALL_DIR/Telegram" "$LOCAL_BIN"

if ! grep -q "$HOME/.local/bin" "$HOME/.bashrc"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
  echo "Added ~/.local/bin to PATH in .bashrc"
fi

mkdir -p "$HOME/.local/share/applications"
# Download Telegram icon and save it in the icons directory
mkdir -p "$HOME/.local/share/icons"
echo "Downloading Telegram icon..."
curl -o "$ICON_PATH" "$ICON_URL"

# Create a .desktop file for Telegram
cat > "$DESKTOP_FILE" <<EOL
[Desktop Entry]
Name=Telegram
Comment=Telegram Desktop Messenger
Exec=$INSTALL_DIR/Telegram -- %u
Icon=$ICON_PATH
Terminal=false
Type=Application
Categories=Network;InstantMessaging;
StartupNotify=false
EOL

chmod +x "$DESKTOP_FILE"

# Optionally reload .bashrc (or the relevant shell config)
source "$HOME/.bashrc"

# Refresh the desktop files
echo "Refreshing desktop database..."
update-desktop-database "$HOME/.local/share/applications"

echo "Telegram installed locally at $INSTALL_DIR. You can run it with 'telegram' or find it in your applications menu."
