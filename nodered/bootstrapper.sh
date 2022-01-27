#!/bin/bash
echo $creds_pass |openssl enc -d --aes256 -in /data/flows_cred.json.aes256 -out /data/flows_cred.json -pass 'stdin'
npm --no-update-notifier --no-fund start --cache /data/.npm -- --userDir /data

