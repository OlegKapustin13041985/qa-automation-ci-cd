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
          success {
                bat '''
                curl -X POST https://api.telegram.org/bot8376273606:AAGsemjjPpiUhK7TiblOVgoKjWVC7hmO5kk/sendMessage ^
                -d chat_id=452639651 ^
                -d text="✅ Jenkins pipeline SUCCESS"
                '''
            }

            failure {
                bat '''
                curl -X POST https://api.telegram.org/bot8376273606:AAGsemjjPpiUhK7TiblOVgoKjWVC7hmO5kk/sendMessage ^
                -d chat_id=452639651 ^
                -d text="❌ Jenkins pipeline FAILED"
                '''
            }

            always {
                echo 'Pipeline finished'
            }
    }
}