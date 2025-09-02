#!/bin/bash

CLIENT_ID=$1
CLIENT_SECRET=$2

RESPONSE=curl -X 'POST' \
  'https://www148.fintrac-canafe.canada.ca/reporting-ingest/oauth2/v2.0/token' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d "client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}"
  
ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')

curl -X 'GET' \
  'https://www148.fintrac-canafe.canada.ca/reporting-ingest/api/v1/reports/list?pageNumber=0&pageSize=20&sortBy=createDateTime-' \
  -H "accept: application/json" \
  -H "Authorization: Bearer $ACCESS_TOKEN"