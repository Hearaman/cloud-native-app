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

        stage('Scan and push image') {
            steps {
                script {
					jf 'docker push $DOCKER_IMAGE_NAME'
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
