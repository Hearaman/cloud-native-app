pipeline {
    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github')
        DOCKERHUB_CREDENTIALS = credentials('docker')
        DOCKER_IMAGE = 'hearaman/docker-images/jenkins:1'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Hearaman/jenkins', credentialsId: 'github', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }

    }

    post {
        always {
            cleanWs()
        }
    }
}
