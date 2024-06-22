pipeline {
    agent any

    tools {
        jfrog 'jfrog-cli'
    }

    environment {
        // Define environment variables
        DOCKER_IMAGE_NAME = "hearaman.jfrog.io/hearaman-docker/hello-frog:2.0.0"
        JFROG_CLI_BUILD_NAME = "hello-frog-build"
        JFROG_CLI_BUILD_NUMBER = "${BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Hearaman/jenkins'
            }
        }

        stage('Build Docker image') {
            steps {
                script {
                    sh 'ls -la'
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
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

        stage('Publish build info') {
            steps {
                script {
                    jf 'rt build-publish'
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Clean up JFrog CLI configuration
                sh "jfrog rt c del --quiet"
            }
        }
    }
}
