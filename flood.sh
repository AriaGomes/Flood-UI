#!/bin/sh
echo "Downloading latest flood release..."
git clone https://github.com/jesec/flood.git flood
cd flood
npm install --global yarn
yarn
yarn build
yarn start