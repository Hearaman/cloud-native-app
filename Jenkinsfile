pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Hearaman/jenkins', credentialsId: 'github', branch: 'main'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
