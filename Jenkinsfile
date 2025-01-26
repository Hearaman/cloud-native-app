pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "hearaman/cloud-native-app"
        DOCKER_TAG = 'latest' //"${env.BUILD_ID}-${env.GIT_COMMIT.take(8)}"
        DOCKERHUB_CREDENTIALS = credentials('Docker')
        DOCKER_USERNAME = 'hearaman'
        GITHUB_CREDENTIALS = credentials('github')
        K8S_NAMESPACE = "production"
    }

    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out the repository.'
                git url: 'https://github.com/Hearaman/cloud-native-app.git', credentialsId: 'github', branch: 'main'
                echo 'Repository checked out successfully.'
            }
        }
        
        /*
        stage('Build Docker image') {
            steps {
                script {
                    echo 'Building Docker image'
                    sh "docker build -t ${DOCKER_IMAGE_NAME} ."
                }
            }
        }
       
        stage('Push image to Docker hub') {
            steps {
                script {
                    echo 'Pushing Docker image'
                    withCredentials([string(credentialsId: 'Docker', variable: 'DOCKERHUB_CREDENTIALS')]) {
                        sh "echo $DOCKERHUB_CREDENTIALS | docker login -u $DOCKER_USERNAME --password-stdin"

                        // Push the image to Docker Hub
                        sh "docker push ${DOCKER_IMAGE_NAME}:${DOCKER_TAG}"
                    }
                }
            }
        }*/

        stage('Kustomize Deployment') {
           
            steps {
                script {

                    sh '''
                        #!/bin/bash
                        if ! command -v ./kustomize &> /dev/null; then
                            echo "kustomize not found. Installing..."
                            curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash
                            // mv ./kustomize /usr/local/bin/
                        else
                            echo "kustomize is already installed."
                        fi
                    '''
                    
                    dir('manifests/overlays/production') {
                        // Update image tag
                       
                        // Build manifests
                        sh "../../../kustomize build . > manifest.yml"

                        // Apply manifests (requires kubectl)
                        sh "kubectl apply -f manifest.yaml"
                    }
                }
            }
        }
    }

}
