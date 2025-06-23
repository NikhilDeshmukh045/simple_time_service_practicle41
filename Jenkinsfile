pipeline {
  agent any
  stages {
    stage('Docker Check') {
      steps {
        sh 'docker version'
        sh 'docker ps'
      }
    }
  }
}
