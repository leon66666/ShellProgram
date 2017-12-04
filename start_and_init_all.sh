#!/bin/sh

echo "start tomcat-mgmt"
sh /opt/tomcat-mgmt/bin/startup.sh
sleep 5m
curl -X POST \
  http://localhost:8090/account/checkUserStatisticCache \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: 87a71fae-5578-528e-deff-e17a966f6349' \
  -F reload=true \
  -F staffName=admin
sleep 5
curl -X POST \
  http://localhost:8090/account/delKeys \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: 05cbd53f-1975-3dd0-be86-ddfdd39e015d' \
  -F 'keys=u:*' \
  -F staffName=admin
sleep 5
curl -X POST \
  http://localhost:8090/loan/loanRedisRecovery \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: db48e831-f1f1-fc80-110f-06d152f9554a' \
  -F staffName=admin
sleep 5
curl -X POST \
  http://localhost:8090/loanTransfer/clearTransferRedisData \
  -H 'cache-control: no-cache' \
  -H 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
  -H 'postman-token: 6634ab01-6a8d-ecaf-fb42-97d496321f7f' \
  -F staffName=admin
sleep 5
echo "start tomcat-web"
sh /opt/tomcat-web/bin/startup.sh
echo "start tomcat-schedule"
sh /opt/tomcat-schedule/bin/startup.sh
echo "start core-match"
sh /opt/core-match/bin/single.sh start
echo "start core-repay"
sh /opt/core-repay/bin/single.sh start
echo "start escrow-retry"
sh /opt/escrow-retry/bin/single.sh start
