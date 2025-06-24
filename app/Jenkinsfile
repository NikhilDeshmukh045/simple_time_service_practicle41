pipeline {
  agent any
  stages {
    stage('Checkout SCM') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t ${DOCKER_REGISTRY}/simple_time_service:${BUILD_NUMBER} .'
      }
    }
    stage('Push Docker Image to Dockerhub') {
       steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker push ${DOCKER_REGISTRY}/simple_time_service:${BUILD_NUMBER}
            docker logout
          '''
        }
      }
    }
  }
}
