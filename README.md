Bulk Submission
===============

Example call
------------

Ensure the input.json.template is updated and includes BULK_PLACEHOLDER for both reportingEntityBulkReference and each report's reportingEntityReportReference as a suffix
eg.
`"reportingEntityBulkReference": "BULK_PLACEHOLDER"`
...
`"reportingEntityReportReference": "12345-BULK_PLACEHOLDER",`

`./fintracjsoncalls/test.sh $CLIENT_ID $CLIENT_SECRET "$(date +%s)"`