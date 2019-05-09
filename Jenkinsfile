node {
    
                    
         stage('connection') {   
               
        sshagent(['e9918d51-4fe9-4566-a544-4ebb33619bdd']) {
    
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@ec2-18-208-252-33.compute-1.amazonaws.com'
                sh 'ssh -o  ubuntu@ec2-18-208-252-33.compute-1.amazonaws.com uptime'
             sh 'sudo ubuntu@ec2-18-208-252-33.compute-1.amazonaws.com docker pull souravraghuvanshi/sourav-jenkins-webapp:ver1'  
             sh 'sudo ubuntu@ec2-18-208-252-33.compute-1.amazonaws.com docker run -d -p 8888:8888 souravraghuvanshi/sourav-jenkins-webapp:ver1'
            }     
            
        }       
   } 
          /*stage('docker pull') {
    

        // sh 'sudo 18.208.252.33 docker pull souravraghuvanshi/sourav-jenkins-webapp:ver1'  
        // sh 'sudo 18.208.252.33 docker run -d -p 8888:8888 souravraghuvanshi/sourav-jenkins-webapp:ver1'
          } */
            
            
            
        
    
