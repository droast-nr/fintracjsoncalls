#!/bin/bash

CLIENT_ID = $1
CLIENT_SECRET = $2

curl -X 'POST' \
  'https://www148.fintrac-canafe.canada.ca/reporting-ingest/oauth2/v2.0/token' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d "client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}"
  
