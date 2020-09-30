node {

    def app

    stages { 
        stage('Cloning our Git') {
            steps {
                git 'https://github.com/joelsipayung/newgen.git'
            }
        }
        stage('Building our image') {
            steps {
                script {
                    app = docker.build ("joelsipayung/app-go-pip-helloworld :${env.BUILD_NUMBER}")
                }
            }
        }
        stage('Deploy our image') {
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', 'joelsipayung' ) {
                        app.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps { 
                sh "docker rmi $joelsipayung/app-go-pip-helloworld:$BUILD_NUMBER"
            }
        }
    }
}