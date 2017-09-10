#!/usr/bin/env bash

abort () {
   echo "Error: $1"
   cd ..
   exit 1
}

rm -rf ark && mkdir ark
cd ark

if hash git 2> /dev/null; then
  git clone https://github.com/yograterol/ark-node ark-repo
else
  abort "git is required. Please install git and retry again."
fi

cd ark-repo

# Install dependencies
if hash npm 2> /dev/null; then
  npm install libpq secp256k1
  npm i
else
  abort "npm is required. Please install Node 6 LTS and retry again."
fi

if hash pkg 2> /dev/null; then
  pkg --targets linux .
  mv ark-node ../
else
  abort "pkg is required. Please install pkg from https://github.com/zeit/pkg."
fi

# Copy Native module
cp node_modules/libpq/build/Release/addon.node ../ && cd .. && rm -rf ark-repo
