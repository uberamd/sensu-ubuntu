pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                docker.build 'sensu-ubuntu:snapshot'
            }
        }
    }
}
