#!/bin/bash
curl -u admin:88931157-28d6-423b-a4c6-fcc978bbfd2e -X POST --header 'Content-Type: application/json' http://localhost:7081/service/rest/v1/tags \
  -d '{
    "name": "passed-unittest",
    "attributes": {
        "jvm": "9",
        "built-by": "jenkins"
    }
}'
