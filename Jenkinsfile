pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git(branch: 'main', url: 'https://github.com/OlegKapustin13041985/qa-automation-ci-cd.git')
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}