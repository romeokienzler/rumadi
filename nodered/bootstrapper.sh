curl -o /data/flows.json https://raw.githubusercontent.com/romeokienzler/rumadi/main/nodered/flows.json
curl -o /data/flows_cred.json.aes256 https://raw.githubusercontent.com/romeokienzler/rumadi/main/nodered/flows_cred.json.aes256
openssl enc -d --aes256 -in /data/flows_cred.json.aes256 -out /data/flows_cred.json
echo $creds_pass |openssl enc -d --aes256 -in /data/flows_cred.json.aes256 -out /data/flows_cred.json -pass 'stdin'
npm install node-red-contrib-ewelink
npm install node-red-dashboard

