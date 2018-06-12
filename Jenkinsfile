#!/usr/bin/groovy

pipeline {
    agent any

    options {
        disableConcurrentBuilds()
    }

    stages {

		stage("Test - Unit tests") {
			steps { runUnittests() }
		}

        stage("Build") {
            steps { buildApp() }
		}

        stage("Deploy - Dev") {
            steps { deploy('dev') }
		}
	}
}


// steps
def buildApp() {
	dir ('srikanth365/emudhra' ) {
		def appImage = docker.build("emudhra/epragathi:${BUILD_NUMBER}")
	}
}
	sh "docker ps -f name=${containerName} -q | xargs --no-run-if-empty docker stop"
	sh "docker ps -a -f name=${containerName} -q | xargs -r docker rm"
	sh "docker run -d -p ${port}:8080 --name ${containerName} emudhra/epragathi:${BUILD_NUMBER}"










