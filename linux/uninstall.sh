#!/bin/bash

cd ./app

MACHINE_TYPE=`uname -m`
if [ ${MACHINE_TYPE} == 'x86_64' ]; then
  id=`../node/x64/node -e "process.stdout.write(require('./config.js').id)"`
else
  id=`../node/x86/node -e "process.stdout.write(require('./config.js').id)"`
fi

echo "Native Client id is \"${id}\""
echo

echo " .. Removing manifest file for Google Chrome"
rm ~/.config/google-chrome/NativeMessagingHosts/${id}.json
echo " .. Removing manifest file for Chromium"
rm ~/.config/chromium/NativeMessagingHosts/${id}.json
echo " .. Removing manifest file for Mozilla Firefox"
rm ~/.mozilla/native-messaging-hosts/${id}.json
echo " .. Removing executable"
rm -r ~/${id}

echo
echo ">>> Native Client is removed <<<".
