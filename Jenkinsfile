node {
    def app

    stage('Clone repository') {
        /* untuk mengclon githubnya */
        checkout scm
    }

    stage('Build image') {
        /* 7untuk build image */

        app = docker.build("joelsipayung/nodapp-go-helloworldexampleeapp")
    }

    stage('Test image') {
        /* test step nya aja */
        app.inside {
            echo "Tests passed"
        }
    }

    stage('Push image') {
        /* push ke docker hub	*/
        docker.withRegistry('https://registry.hub.docker.com', 'joelsipayung') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
            } 
                echo "Trying to Push Docker Build to DockerHub"
    }
}
