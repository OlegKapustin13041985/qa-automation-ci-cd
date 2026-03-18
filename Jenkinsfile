def notify(status) {
    def message = """
${status}

Job: ${env.JOB_NAME}
Build: #${env.BUILD_NUMBER}
Status: ${currentBuild.currentResult}
Duration: ${currentBuild.durationString}

URL: ${env.BUILD_URL}
"""

    powershell """
    Invoke-RestMethod -Uri "https://api.telegram.org/bot8376273606:AAGsemjjPpiUhK7TiblOVgoKjWVC7hmO5kk/sendMessage" `
    -Method Post `
    -Body @{
        chat_id="452639651"
        text="${message}"
    }
    """
}

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
           notify("✅ SUCCESS")
       }

       failure {
           notify("❌ FAILED")
       }
    }
    //test
}
