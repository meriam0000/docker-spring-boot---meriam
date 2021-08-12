pipeline {
    agent any
     // environment {
        
    //registry = "thourayalouati/docker-spring-boot"
    
    //registryCredential = 'dockerHub'
    
    //dockerImage = ''
    
    //}
  stages{
  /*    stage('Initialize')
    {
        def dockerHome = tool 'MyDocker'
        env.PATH = "${dockerHome}/bin:${mavenHome}/bin:${env.PATH}"
    }*/

      /* stage('clone and clean repo'){
            steps {
                   bat "git clone https://gitlab.com/ThourayaLouati/docker-spring-boot"
                   
                  }
       }*/
        /*stage("clean") {

            steps {

                script {

                    // Let's clone the source

                    bat "mvn clean -f docker-spring-boot"

                }

            }
        }
        stage("mvn build package") {

            steps {

                script {

                    // If you are using Windows then you should use "bat" step

                    // Since unit testing is out of the scope we skip them

                    bat "mvn -B package -DskipTests=true -f docker-spring-boot"

                }

            }

        }*/
          stage('Building image') {
            
            steps{
        
                script {
                    
                   // dockerImage = docker.build registry + ":$BUILD_NUMBER"
                
                 //  bat "docker build"+registry
                   
                   bat  "docker build -t thourayalouati/docker-spring-boot:56 ."
                }
            }
        }
        
  
    
}
}
