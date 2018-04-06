pipeline {
    agent { docker { image 'node:7-alpine' } }
    stages {
        stage('build') {
            steps {
                sh """
                        #!/bin/bash -l

                        mkdir .docker


                        # make sure old containers are gone
                          docker-compose down

                        # build the system
                          docker-compose build
                      """
            }
        }
        stage('test'){
          steps {
            sh """
            #!/bin/bash -l

            #starting the mysql containers
            docker-compose up -d db

            sleep 10
             #load the database
             docker-compose run web rake db:setup

            """
          }
        }
        stage('deploy'){
          steps{
           sh """
            #!/bin/bash -l
            docker-compose up web
            """
          }
        }
    }
}

