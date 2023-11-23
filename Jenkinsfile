pipeline{
    agent{
        label 'jdk'
    }
    triggers{
        pollSCM('* * * * *')
    }
    tools{
        jdk 'JDK-17'
    }

    stages{
        stage(git){
           steps {
             git url: 'https://github.com/Praneethysp007/spring-docker.git',
                 branch: 'main'
           }
        }
        stage(build) {
            sh 'mvn package'
        }
        stage(artifacts) {
            archiveArtifacts artifacts: '**/target/*.jar'
        }
        stage(dockerbuildimage) {
            sh 'docker image build -t praneethysp007/expimge:1.0 .'
        }
        stage(pushimage) {
            script(
                withCredentials([string(credentialsId: 'dockerpass', variable: 'mypasswd')]) {
                sh 'docker login -u praneethysp007 -p ${mypasswd}'

                sh 'docker push praneethysp007/expimge:1.0'
    // some block
                }
            )
        }
    }

}