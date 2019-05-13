node {
    def server = Artifactory.server 'artifactory'
    def rtMaven = Artifactory.newMavenBuild()
    
    def buildInfo
    def mvnHome
    jdk = tool name: 'JAVA8'
    env.JAVA_HOME = "${jdk}"
    
    stage ('checkout scm') {
    checkout scm
    }
    stage ('Artifactory configuration') {
        mvnHome = tool 'mavenhome'
        rtMaven.tool = 'mavenhome' // Tool name from Jenkins configuration
        rtMaven.deployer releaseRepo: 'libs-release-local', snapshotRepo: 'libs-snapshot-local', server: server
        rtMaven.resolver releaseRepo: 'libs-release', snapshotRepo: 'libs-snapshot', server: server
        buildInfo = Artifactory.newBuildInfo()
        buildInfo.env.capture = true
    }

   /* stage ('Exec Maven') {
    
       rtMaven.run pom: 'pom.xml', goals: 'clean install', buildInfo: buildInfo
    }

    stage ('Publish build info') {
        server.publishBuildInfo buildInfo
    }
     stage('SonarQube analysis') {
        mvnHome = tool 'mavenhome'
    withSonarQubeEnv('sonar') {
     //  requires SonarQube Scanner for Maven 3.2+
      rtMaven.run pom: 'pom.xml', goals: 'clean package sonar:sonar', buildInfo: buildInfo
    }
     } 

  stage('Build Docker image') {
       
         sh 'sudo docker build -t sourav-jenkins-webapp:ver1 .'
     }

     stage('Push image') 
                             {
                                 
                             
            
           withCredentials([usernamePassword(credentialsId: 'docker-hub-raghuvanshi', passwordVariable: 'dockerpass', usernameVariable: 'dockeruser')]) {
    // some block
// some block



sh "sudo docker login -u $dockeruser -p $dockerpass"
sh 'sudo docker tag sourav-jenkins-webapp:ver1 souravraghuvanshi/sourav-jenkins-webapp:ver1'
sh ' sudo docker push souravraghuvanshi/sourav-jenkins-webapp:ver1'
           }
}
  */
   stage('Build') {
    

         sh 'terraform init'
         withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'SouravAWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
       {
        sh 'terraform apply -auto-approve'
  

      }
   }
                    
        /* stage('connection') {   
               
        sshagent(['SouravSec']) {
    
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-234-154-79.compute-1.amazonaws.com'
             sh 'ssh ubuntu@ec2-18-234-154-79.compute-1.amazonaws.com sudo docker stop sourav'
             sh 'ssh ubuntu@ec2-18-234-154-79.compute-1.amazonaws.com sudo docker rm sourav'
             sh 'ssh ubuntu@ec2-18-234-154-79.compute-1.amazonaws.com sudo docker pull souravraghuvanshi/sourav-jenkins-webapp:ver1'  
             sh 'ssh ubuntu@ec2-18-234-154-79.compute-1.amazonaws.com sudo docker run -d -p 8888:8888 --name=sourav souravraghuvanshi/sourav-jenkins-webapp:ver1'
            }      
            
        }  */     
   } 
          /*stage('docker pull') {
    

        // sh 'sudo 18.208.252.33 docker pull souravraghuvanshi/sourav-jenkins-webapp:ver1'  
        // sh 'sudo 18.208.252.33 docker run -d -p 8888:8888 souravraghuvanshi/sourav-jenkins-webapp:ver1'
          } */
            
            
            
        
    
