#!/bin/bash


echo "Logging in to get a valid JWT token - expecting 200 OK"
echo

/usr/bin/curl --insecure  \
  -i \
  -X POST \
  -H 'Content-Type: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJhY2NvdW50SWRcIjoxLFwidXNlclByb2ZpbGVJZFwiOjExLFwicm9sZXNcIjpbXCJBRE1JTlwiLFwiRElTUEFUQ0hFUlwiXSxcInRpbWVDcmVhdGVkXCI6MTQ4MTc1NDQ5MDUxMSxcInNlY29uZHNUb0V4cGlyZVwiOjEwMDAwfSIsImp0aSI6ImZjYTA1OGJhLWI0MmMtNDlhMS04NGI0LWVmMWM3OTgzYTdjZiJ9.auTRnG75ssQrf3MbAg6vy4-Eg-Xx3ryEy09YlqLGglUgFiCOISIxu1Ul4Y8Fpgim4Nc9Y4ZQja5pbuOw4derMA' \
  -d '{"username":"dispatcher1@fr8.guru","password": "password1"}' \
  https://mkt.dev.fr8.guru:8003/user/login


echo
echo "Use the JWT token from there and put it here"
echo
echo "Creating document - expecting 200 OK"
echo

JWT="eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ7XCJhY2NvdW50SWRcIjoxLFwidXNlclByb2ZpbGVJZFwiOjExLFwicm9sZXNcIjpbXCJBRE1JTlwiLFwiRElTUEFUQ0hFUlwiXSxcInRpbWVDcmVhdGVkXCI6MTQ4MTc1NDQ5MDUxMSxcInNlY29uZHNUb0V4cGlyZVwiOjEwMDAwfSIsImp0aSI6ImZjYTA1OGJhLWI0MmMtNDlhMS04NGI0LWVmMWM3OTgzYTdjZiJ9.auTRnG75ssQrf3MbAg6vy4-Eg-Xx3ryEy09YlqLGglUgFiCOISIxu1Ul4Y8Fpgim4Nc9Y4ZQja5pbuOw4derMA"

/usr/bin/curl --insecure  \
  -i \
  -X POST \
  -H 'Content-Type: application/json' \
  -H "Authorization: Bearer $JWT" \
  -d '{"parentType":"user","parentId":9,"documentType":"application/pdf","name":"pdf.pdf","contentType":"application/pdf","contentLength":433994}' \
  https://mkt.dev.fr8.guru:8043/document

echo
echo "SUCCESS if you got 200 OK"
echo
