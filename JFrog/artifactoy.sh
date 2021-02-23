#https://www.jfrog.com/confluence/display/JFROG/Installing+Artifactory

JFROG_HOME=~/
mkdir -p $JFROG_HOME/artifactory/var/etc/
cd $JFROG_HOME/artifactory/var/etc/
touch ./system.yaml
sudo chown -R 1030:1030 $JFROG_HOME/artifactory/var
sudo chmod -R 777 $JFROG_HOME/artifactory/var

docker run --name artifactory -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-pro:latest

sleep 10

docker ps

echo "You can now login to Artifactory with username: admin password: password"
echo "Trial License requirred. The trial key is in the trial signup confirmation email"
