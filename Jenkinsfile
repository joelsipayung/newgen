pipeline {
    environment {
        registry = "joelsipayung/app-go-pip-helloworld"
        registryCredential = 'joelsipayung'
        dockerImage = ''
    }
    def app
    agent any
    stages { 
        stage('Cloning our Git') {
            steps {
                git 'https://github.com/joelsipayung/newgen.git'
            }
        }
        stage('Building our image') {
            steps {
                script {
                    app = docker.build ("registry :${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( 'https://hub.docker.com', registryCredential ) {
                        app.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}