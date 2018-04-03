pipeline {
    agent { dockerfile true }
    stages {
        stage('build') {
            steps {
                sh '''
                docker-compose down
                docker-compose build
                docker-compose up -d db
                '''
            }
        }
        stage('test'){
          steps {
            sh '''
            echo 'test phase'
            '''
          }
        }
        stage('deploy'){
          steps{
            sh '''
            docker-compose up web
            '''
          }
        }
    }
}
