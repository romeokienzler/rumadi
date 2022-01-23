k apply -f pod.yaml
k apply -f service.yaml
#todo implement / check on deployment finish
sleep 10
k exec -it  nifi -- bash -c "curl -o /opt/nifi/nifi-current/lib/postgresql-42.2.18.jar https://jdbc.postgresql.org/download/postgresql-42.2.18.jar"
k exec -it  nifi -- bash -c "curl -o /opt/nifi/nifi-current/lib/json-simple-1.1.1.jar https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/json-simple/json-simple-1.1.1.jar"


sed -i 's/java.arg.3=-Xmx512m/java.arg.3=-Xmx2048m/g'  /opt/nifi/nifi-current/conf/bootstrap.conf
