#!/bin/bash
docker network create proget
PASSWORD="Stifstof20202"

docker run --name proget-sql \
      -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=($PASSWORD)' \
      -e 'MSSQL_PID=Express' --net=proget --restart=unless-stopped \
      -d mcr.microsoft.com/mssql/server:2019-latest

echo "Sleeping 30 waiting for sql"
sleep 30

docker exec -it proget-sql /opt/mssql-tools/bin/sqlcmd \
   -S localhost -U SA -P '($PASSWORD)' \
   -Q 'CREATE DATABASE [ProGet] COLLATE SQL_Latin1_General_CP1_CI_AS'

docker restart proget-sql

echo "Sleeping 30 waiting for sql after reboot"
sleep 30

docker run -d -v proget-packages:/var/proget/packages -p 80:80 --net=proget \
    --name=proget --restart=unless-stopped \
    -e SQL_CONNECTION_STRING='Data Source=proget-sql; Initial Catalog=ProGet; User ID=sa; Password=($PASSWORD)' \
    proget.inedo.com/productimages/inedo/proget:5.3.10

echo "You can now login to ProGet with username: admin password: admin"
echo "Trial license is requirred. Obtain trial key on ProGet website"
