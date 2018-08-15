node {
    stage('ScorceCodeFromGit') {
    git 'https://github.com/rcp-suresh/shipwrick.git'
}
    stage('MavenBuild') {
    Maven_Home=tool name: 'maven-3.3.9', type: 'maven'
    Maven_Bin="${Maven_Home}/bin"
    sh "${Maven_Bin}/mvn clean package"
}
    stage('DeployToDev') {
    sh 'mv /var/lib/jenkins/workspace/JenkinsPipeline/target/*.war target/shipwick.war'
    sh 'scp -i /ec2key.pem -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/JenkinsPipeline/target/shipwick.war ec2-user@52.37.95.251:/opt/tomcat8/webapps/'
}
    stage('UploadToNexus') {
    Maven_Home=tool name: 'maven-3.3.9', type: 'maven'
    Maven_Bin="${Maven_Home}/bin"
    sh "${Maven_Bin}/mvn clean deploy"
}
    stage('DeployToProduction') {
    sh 'mv /var/lib/jenkins/workspace/JenkinsPipeline/target/*.war target/shipwick.war'
    sh 'scp -i /ec2key.pem -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/JenkinsPipeline/target/shipwick.war ec2-user@35.167.88.215:/opt/tomcat8/webapps/'

}

}
