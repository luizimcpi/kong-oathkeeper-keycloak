# Creates an secure-api service
# and proxies network traffic to oathkeeper
curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=secure-api' \
  --data 'url=http://localhost:4455'

# Creates routes for secure-api service
curl -i -X POST \
  --url http://localhost:8001/services/secure-api/routes \
  --data 'paths[]=/'\