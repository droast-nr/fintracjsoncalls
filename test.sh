#!/bin/bash

CLIENT_ID=$1
CLIENT_SECRET=$2
BULK_FILENAME=$3

RESPONSE=$(curl -X 'POST' \
  'https://www148.fintrac-canafe.canada.ca/reporting-ingest/oauth2/v2.0/token' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d "client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}")
  
ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')
  
RESPONSE=$(curl -X 'GET' \
  "https://www148.fintrac-canafe.canada.ca/reporting-ingest/api/v1/bulkSubmission?fileName=$BULK_FILENAME.json" \
  -H 'accept: application/json' \
  -H "Authorization: Bearer $ACCESS_TOKEN")
  
URL=$(echo "$RESPONSE" | jq -r '.payload.bulkEndpoint')

sed "s/BULK_PLACEHOLDER/$BULK_FILENAME/g" input.json > input.json.tmp

curl -X 'PUT' \
  "$URL" \
  -H 'accept: */*' \
  -H 'x-ms-blob-type: BlockBlob' \
  -H 'Content-Type: application/octet-stream' \
  --data-binary '@input.json.tmp'
  
curl -X 'GET' \
  "https://www148.fintrac-canafe.canada.ca/reporting-ingest/api/v1/reports/validations?fileName=$BULK_FILENAME.json" \
  -H 'accept: application/json' \
  -H "Authorization: Bearer $ACCESS_TOKEN"