pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker')
        GITHUB_CREDENTIALS = credentials('github')
        DOCKER_IMAGE = 'hearaman/docker-images:latest'
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the repository...'
                git url: 'https://github.com/Hearaman/jenkins.git', credentialsId: 'github', branch: 'main'
                echo 'Repository checked out successfully.'
            }
        }
    }

}
