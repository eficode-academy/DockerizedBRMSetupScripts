#!/bin/bash
curl -u admin:88931157-28d6-423b-a4c6-fcc978bbfd2e -X DELETE 'http://127.0.0.1:7081/service/rest/v1/tags/associate/passed-unittest?repository=maven-integration&group=com.mycompany.app&name=EDHOC-prototype&version='$1
