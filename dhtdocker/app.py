from flask import Flask
from flask import request
import os

import ibm_boto3
from ibm_botocore.client import Config, ClientError
from datetime import datetime

app = Flask(__name__)

@app.route("/")
def hello():
	temperature = request.args.get('temperature')
	humidity = request.args.get('humidity')

	file_name = datetime.strftime(datetime.utcnow(), "%s")+'.csv'

	# Create resource
	client = ibm_boto3.client(
		's3',
		aws_access_key_id = 'a32041d245e04817aa58fd0b06e8a1a3',
		aws_secret_access_key = '884b1e7b06c9c382ffb91810e13c2e3c67679bad883204f5',
		endpoint_url='https://s3.eu-de.cloud-object-storage.appdomain.cloud'
	)

	with open(file_name, "a") as myfile:
		myfile.write(str(temperature)+";"+str(humidity)+"\n")

	client.upload_file(file_name,'rumadi', file_name)


	return "Flask inside Docker!!"+str(temperature)+str(humidity)


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 8080))
    app.run(debug=True,host='0.0.0.0',port=port)
