pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', git 'https://github
                .com/OlegKapustin13041985/qa-automation-ci-cd.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}