pipeline {
    agent any

    stages {

        stage('Docker Build') {
                    steps {
                        bat 'docker build -t qa-automation .'
                    }
                }

                stage('Run Tests in Docker') {
                    steps {
                        bat 'docker run qa-automation'
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

    }

    post {
        always {
            echo 'Pipeline finished'
        }
    }
}
