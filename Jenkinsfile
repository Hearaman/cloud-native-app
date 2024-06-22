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
                
                script {
                    println 'Building the Docker image...'
                    docker.build(DOCKER_IMAGE)
                    println 'Docker image built successfully.'
                }
                
            }
        }

        stage('Push to Docker Hub') {
            steps {
                
                script {
                    println 'Pushing the Docker image to Docker Hub...'
                    docker.withRegistry('', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                    println 'Docker image pushed to Docker Hub successfully.'
                }
                
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
