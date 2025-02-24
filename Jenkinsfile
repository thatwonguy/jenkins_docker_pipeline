pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/thatwonguy/jenkins_docker_pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build --no-cache -t python-docker-jenkins:latest .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop python-container || true && docker rm python-container || true'
                sh 'docker run -d -p 9090:8080 --name python-container python-docker-jenkins'
            }
        }
    }
}
