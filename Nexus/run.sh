docker run -d -p 7081:8081 --name nexus sonatype/nexus3

sleep 10

./get_nexus_password_from_container.sh

echo "You can now login to Nexus with username: admin password:"

cat admin.password

echo "License is required. Go to inendo.com and request trial key file"
