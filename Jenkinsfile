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
                bat '"C:\\Program Files\\apache-maven-3.8.7\\bin\\mvn.cmd" clean compile'
            }
        }

        stage('Test') {
            steps {
                bat '"C:\\Program Files\\apache-maven-3.8.7\\bin\\mvn.cmd" test'
            }
        }

        stage('Allure Report') {
            steps {
                allure includeProperties: false,
                jdk: '',
                results: [[path: 'target/allure-results']]
            }

    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}