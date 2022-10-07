pipeline{
    agent any
    
    stages{
        stage('git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/priyanka-1994/simple-docker-image-demo.git']]])
            }
        }
        stage('docker build image'){
            steps{
                script {
                    sh 'docker build -t prikale/$JOB_NAME:v1.$BUILD_ID .'
                }
            }   
        }
        stage('push docker image') {
            steps{
                script{
                    withCredentials([string(credentialsId: 'DockerCredentials', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u prikale -p ${dockerhubpwd}'
                        sh 'docker push prikale/$JOB_NAME:v1.$BUILD_ID'
                }
            }
        }
    }
}
}
