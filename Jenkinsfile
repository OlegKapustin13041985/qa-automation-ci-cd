pipeline {
    agent any

    stages {

        stage('Docker Build') {
            steps {
                bat 'docker build -t qa-automation .'
            }
        }

        stage('Parallel Tests') {
            parallel {

                stage('Chrome Tests') {
                    steps {
                        bat 'docker run --rm qa-automation'
                    }
                }

                stage('Firefox Tests') {
                    steps {
                        bat 'docker run --rm qa-automation'
                    }
                }

            }
        }

        stage('Allure Report') {
            steps {
                allure includeProperties: false,
                jdk: '',
                results: [[path: 'target/allure-results']]
            }
        }

    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}