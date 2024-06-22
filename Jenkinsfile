pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker')
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

        stage('Build Docker Image') {
            steps {
                echo 'Building the Docker image...'
                script {
                    docker.build(DOCKER_IMAGE)
                }
                echo 'Docker image built successfully.'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing the Docker image to Docker Hub...'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
                echo 'Docker image pushed to Docker Hub successfully.'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up the workspace...'
            cleanWs()
            echo 'Workspace cleaned up.'
        }
    }
}
