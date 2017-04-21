docker.withRegistry('https://registry.hub.docker.com', '01f028bd-24f2-43da-9366-05859f9cda11') {
    stage 'Building image'
    def buildContainer = docker.build "uberamd/sensu-docker:${env.BUILD_NUMBER}"
    buildContainer.push()

    stage 'Pushing image'
    buildContainer.push 'latest'
}
