#!/bin/sh
echo "Downloading latest flood release..."
url=$(curl -s https://api.github.com/repos/jesec/flood/releases/latest | grep -w "browser_download_url.*flood-linux-arm64" | head -1 | cut -d : -f 2,3 | tr -d \")
curl -L --output "flood-ui" $url
chmod +x ./flood-ui
./flood-ui -d flood/