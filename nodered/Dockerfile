FROM nodered/node-red
USER root	
RUN chmod -R 777 /data/
USER node-red
ADD start.sh .
ENTRYPOINT ["start.sh"]
