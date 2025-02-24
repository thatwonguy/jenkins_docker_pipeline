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
                sh 'docker build -t python-docker-jenkins .'
            }
        }

        stage('Run Container') {
            steps {
                sh 'docker stop python-container || true && docker rm python-container || true'
                sh 'docker run -d -p 8080:8080 --name python-container python-docker-jenkins'
            }
        }
    }
}
