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

  /*  stage ('Exec Maven') {
    
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
     } */
  
  stage('Build Docker image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line 
          */
         sh 'sudo docker build -t sourav-jenkins-webapp:ver1 .'
     }

     stage('Push image') 
                             {
                                 
                             /* Finally, we'll push the image with two tags:
                                           * First, the incremental build number from Jenkins
                                           * Second, the 'latest' tag.
                                           * Pushing multiple tags is cheap, as all the layers are reused. 
                                           
                                          sudo docker.withRegistry('https://registry.hub.docker.com', 'docker-hub') {
            sudo app.push("${env.BUILD_NUMBER}")
            sudo app.push("latest")*/
            
           withCredentials([usernamePassword(credentialsId: 'docker-hub-raghuvanshi', passwordVariable: 'dockerpass', usernameVariable: 'dockeruser')]) {
    // some block
// some block



sh "sudo docker login -u $dockeruser -p $dockerpass"
sh 'sudo docker tag sourav-jenkins-webapp:ver1 souravraghuvanshi/sourav-jenkins-webapp:ver1'
sh ' sudo docker push souravraghuvanshi/sourav-jenkins-webapp:ver1'
           }
}
   stage('Build') {
    

         sh 'terraform init'
         withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'SouravAWS', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']])
       {
        sh 'terraform apply -auto-approve'
  

      }
   }
                                 
                                 
         stage('connection') {   
               
        sshagent(['e9918d51-4fe9-4566-a544-4ebb33619bdd']) {
    
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-208-252-33.compute-1.amazonaws.com'
            sh 'ssh -o ubuntu@ec2-18-208-252-33.compute-1.amazonaws.com uptime'
             //sh 'sudo 18.208.252.33 docker pull souravraghuvanshi/sourav-jenkins-webapp:ver1'  
             //sh 'sudo 18.208.252.33 docker run -d -p 8888:8888 souravraghuvanshi/sourav-jenkins-webapp:ver1'
            }     
            
        }       
   } 
          /*stage('docker pull') {
    

        // sh 'sudo 18.208.252.33 docker pull souravraghuvanshi/sourav-jenkins-webapp:ver1'  
        // sh 'sudo 18.208.252.33 docker run -d -p 8888:8888 souravraghuvanshi/sourav-jenkins-webapp:ver1'
          } */
            
            
            
        
    
