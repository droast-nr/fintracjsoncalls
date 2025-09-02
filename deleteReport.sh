#!/bin/bash
curl -X 'DELETE' \
  'https://www148.fintrac-canafe.canada.ca/reporting-ingest/api/v1/reports' \
  -H 'accept: */*' \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -d '{
  "reportDetails": {
    "reportTypeCode": 102,
    "submitTypeCode": 5,
    "reportingEntityNumber": 12345,
    "submittingReportingEntityNumber": 12345,
    "reportingEntityReportReference": "CASE_NAME_1756840597",
    "reportSubmitReasonCode": 3
  }
}'
