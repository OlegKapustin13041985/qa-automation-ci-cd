pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t qa-automation .'
            }
        }

        stage('Run Tests') {
            parallel {
                Chrome: {
                    steps {
                        bat 'docker run --rm -v %cd%/target/chrome:/app/target -v %USERPROFILE%\\.m2:/root/.m2 qa-automation'
                    }
                }
                Firefox: {
                    steps {
                        bat 'docker run --rm -v %cd%/target/firefox:/app/target -v %USERPROFILE%\\.m2:/root/.m2 qa-automation'
                    }
                }
            }
        }

        stage('Generate Allure Report') {
            steps {
                allure(
                    includeProperties: false,
                    jdk: '',
                    results: [
                        [path: 'target/chrome/allure-results'],
                        [path: 'target/firefox/allure-results']
                    ]
                )
            }
        }
    }

    post {
        success {
            bat 'curl -X POST https://api.telegram.org/botTOKEN/sendMessage -d chat_id=CHAT_ID -d text="✅ Jenkins pipeline SUCCESS"'
        }

        failure {
            bat 'curl -X POST https://api.telegram.org/botTOKEN/sendMessage -d chat_id=CHAT_ID -d text="❌ Jenkins pipeline FAILED"'
        }

        always {
            echo 'Pipeline finished'
        }
    }
}