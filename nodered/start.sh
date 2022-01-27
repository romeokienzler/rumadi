#!/bin/bash
curl -o /bootstrapper.sh https://raw.githubusercontent.com/romeokienzler/rumadi/main/nodered/bootstrapper.sh
/bootstrapper.sh
npm --no-update-notifier --no-fund start --cache /data/.npm -- --userDir /data

