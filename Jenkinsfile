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
                        bat 'docker run --rm -v %cd%/target/chrome:/app/target qa-automation'
                    }
                }

                stage('Firefox Tests') {
                    steps {
                         bat 'docker run --rm -v %cd%/target/firefox:/app/target qa-automation'
                    }
                }

            }
        }

    }

    post {

   always {

           allure(
                          includeProperties: false,
                          jdk: '',
                          results: [
                              [path: 'target/chrome/allure-results'],
                              [path: 'target/firefox/allure-results']
                          ])

           echo 'Pipeline finished'
       }

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
    }
}