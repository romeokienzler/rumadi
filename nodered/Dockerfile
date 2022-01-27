FROM nodered/node-red
USER root	
RUN chmod -R 777 /data/
USER node-red
RUN curl -o /data/flows.json https://raw.githubusercontent.com/romeokienzler/rumadi/main/nodered/flows.json
RUN curl -o /data/flows_cred.json.aes256 https://raw.githubusercontent.com/romeokienzler/rumadi/main/nodered/flows_cred.json.aes256
RUN npm install node-red-contrib-ewelink
RUN npm install node-red-dashboard
ADD bootstrapper.sh /
#RUN chmod 755 /bootstrapper.sh
ENTRYPOINT ["/bootstrapper.sh"]
