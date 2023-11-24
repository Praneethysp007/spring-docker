pipeline{
    
    agent{
        label 'jdk-17'
    }
    triggers{
        pollSCM('* * * * *')
    }
    tools{
        jdk 'JDK-17'
    }
    stages{
        stage(git){
           steps{
             git url: 'https://github.com/Praneethysp007/spring-docker.git',
                 branch: 'main'
           }
        }
        stage(build){
            steps{
               sh 'mvn package'
            }
        }
        stage(artifacts){
            steps{
                archiveArtifacts artifacts: '**/target/*.jar'
            }
        }
        // stage(dockerbuildimage){
        //     steps{
        //         sh 'docker image build -t praneethysp007/expimge:1.0 .'
        //     }
        // }
        // stage(pushimage){
        //     steps{
        //         script{
        //             withCredentials([string(credentialsId: 'dockerpass', variable: 'mypasswd')]) {

        //             sh 'docker login -u praneethysp007 -p ${mypasswd}'

        //             sh 'docker push praneethysp007/expimge:1.0'
         
        //             }
        //         }
        //     }   
            
        // }
    }

}