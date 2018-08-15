##secure copy from one server to onither server##
mv target/*.war target/shipwick.war
scp -i /home/ubuntu/ec2key.pem -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/wipro-myweb/target/myapp-SNAPSHOT-1.0-1.1.4.war ubuntu@34.217.148.218:/opt/tomcat8/webapps/

##To pick latest version fron pom.xml and download##

a=$(head -n 7 pom.xml | tail -n 1 |awk '{print $1}' | sed -e "s/<version>//" | sed 's/.\{10\}$//')
or
cat pom.xml | grep "<version>" | head -n 1 |awk '{print $1}' |sed -e "s/<version>//" |sed 's/<.*//'
echo $a
rm -rf *.war
wget http://18.236.64.135:8081/repository/maven-releases/in/mpcechno/myapp/$a/myapp-$a.war
mv *.war myapp.war


or

a=$(cat pom.xml | grep "<version>" | head -n 1 |awk '{print $1}' |sed -e "s/<version>//" |sed 's/.\{10\}$//')
echo $a
rm -rf *.war
wget http://34.219.119.246:8081/repository/Shipwrick/com/boot/shipwreck/$a/shipwreck-$a.war
mv *.war shipwrick.war
scp -i /ec2key.pem -o StrictHostKeyChecking=no shipwrick.war ec2-user@54.244.198.19:/opt/tomcat8/webapps/
