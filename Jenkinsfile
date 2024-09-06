pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "hearaman/cloud-native-app"
        DOCKERHUB_CREDENTIALS = credentials('Docker')
        GITHUB_CREDENTIALS = credentials('github')
    }

    stages {
        stage('Checkout') {
            steps {
                println 'Checking out the repository...'
                git url: 'https://github.com/Hearaman/jenkins.git', credentialsId: 'github', branch: 'main'
                echo 'Repository checked out successfully.'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    println 'Building Docker image'
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }
        stage('Push image to Docker hub') {
            steps {
                script {
                    println 'Pushing Docker image'
                    sh 'docker login'
                    sh 'docker push $DOCKER_IMAGE_NAME'
                }
            }
        }
    }

}
